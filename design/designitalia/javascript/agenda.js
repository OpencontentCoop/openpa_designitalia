;(function ($, window, document, undefined) {

    "use strict";

    var pluginName = "initSearchView",
        defaults = {};

    function InitSearchView(element, options) {
        this.element = element;
        this.settings = $.extend({}, defaults, options);
        this._defaults = defaults;
        this._name = pluginName;
        this.init();
    }

    // Avoid Plugin.prototype conflicts
    $.extend(InitSearchView.prototype, {
        init: function () {
            var tools = $.opendataTools;

            var spinner = $($.templates("#tpl-spinner").render({}));

            var empty = $.templates("#tpl-empty").render({});

            var viewCalendar = $('#agenda');

            var preview = $('#preview');

            var isChangeView = false;

            var initCalendar = function (view) {
                $( "#agenda-container" ).on( "tabsactivate", function( event, ui ) {
                  var hash = ui.newTab.context.hash;
                  if (hash == '#agenda') {
                    // view.setFilterValue('date', 'next 30 days');
                    // view.doSearch();
                    refreshCalendar(view);
                    $('.widget[data-filter="date"]').addClass('hide');
                    isChangeView = true;
                  } else {
                    $('.widget[data-filter="date"]').removeClass('hide');
                  }
                });
            };

            var refreshCalendar = function (view, response) {
                if ($.isFunction($.fn.fullCalendar)) {
                    var defaultDate = moment();
                    if (viewCalendar.data('fullCalendar')) {
                        viewCalendar.fullCalendar('destroy');
                    }
                    viewCalendar.fullCalendar({
                        header: {
                            center: "title",
                            right: "agendaDay,agendaWeek,month",
                            left: "prev,today,next"
                        },
                        defaultView: viewCalendar.data('default_view') || 'agendaWeek',
                        locale: tools.settings('locale'),
                        axisFormat: 'H(:mm)',
                        aspectRatio: 1,
                        selectable: false,
                        defaultDate: defaultDate,
                        editable: false,
                        timeFormat: 'H:mm',
                        eventClick: function (calEvent, jsEvent, view) {
                            window.location.href = $.opendataTools.settings('accessPath') + '/content/view/full/' + calEvent.content.metadata.mainNodeId;
                        },
                        events: function(start, end, timezone, callback) {
                            var currentQueryParts = view.buildQuery();
                            currentQueryParts.filters.date = null;
                            var startQuery = start.set('hour', 0).set('minute', 0).format('YYYY-MM-DD HH:mm');
                            var endQuery = end.set('hour', 23).set('minute', 59).format('YYYY-MM-DD HH:mm');
                            var data = {
                                q: encodeURIComponent(view.buildQueryParts(currentQueryParts)),
                                start: startQuery,
                                end: endQuery
                            };
                            $.ajax({
                                url: tools.settings().endpoint.fullcalendar,
                                data: data,
                                success: function(events) {                                    
                                    callback(events);
                                }
                            });
                        }
                    });
                }
            };

            var loadCalendarResults = function (response, query, appendResults, view) {
                if (!isChangeView) {
                    refreshCalendar(view, response);
                } else {
                    isChangeView = false;
                }
            };

            var loadListResults = function (response, query, appendResults, view) {
                spinner.remove();
                if (response.totalCount > 0) {
                    var template = $.templates("#tpl-event");
                    $.views.helpers(OpenpaAgendaHelpers);

                    var htmlOutput = template.render(response.searchHits);
                    if (appendResults) view.container.append(htmlOutput);
                    else view.container.html(htmlOutput);

                    if (response.nextPageQuery) {
                        var loadMore = $($.templates("#tpl-load-other").render({}));
                        loadMore.find('a').bind('click', function (e) {
                            view.appendSearch(response.nextPageQuery);
                            loadMore.remove();
                            view.container.append(spinner);
                            e.preventDefault();
                        });
                        view.container.append(loadMore)
                    }
                } else {
                    view.container.html(empty);
                }
            };

            var data = $(this.element).data('opendataSearchView');
            if (!data) {
                $(this.element).opendataSearchView({
                    query: $.opendataTools.settings('base_query'),
                    onInit: function (view) {
                        //initMap();
                        initCalendar(view);
                    },
                    onBeforeSearch: function (query, view) {
                        view.container.html(spinner);
                    },
                    onLoadResults: function (response, query, appendResults, view) {
                        loadListResults(response, query, appendResults, view);
                        //loadMapResults(response, query, appendResults, view);
                        loadCalendarResults(response, query, appendResults, view);
                    },
                    onLoadErrors: function (errorCode, errorMessage, jqXHR, view) {
                        view.container.html('<div class="alert alert-danger">' + errorMessage + '</div>')
                    }
                });
            }
        }
    });
    $.fn[pluginName] = function (options) {
        return this.each(function () {
            if (!$.data(this, "plugin_" + pluginName)) {
                $.data(this, "plugin_" +
                    pluginName, new InitSearchView(this, options));
            }
        });
    };

})(jQuery, window, document);
$(document).ready(function () {
    $("#agenda-container").tabs({
        active: $('.agenda-views .nav-tab').index($('.agenda-views .nav-tab.active')),
        activate: function(event, ui){}
    });
});
