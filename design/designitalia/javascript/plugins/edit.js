var select_to_string = function (element) {
    var newValue = $(element).val();
    var $input = $(element).next();
    if (newValue.length > 0) {
        var current = $input.val().length > 0 ? $input.val().split(',') : [];
        current.push(newValue);
        function unique(array) {
            return array.filter(function (el, index, arr) {
                return index == arr.indexOf(el);
            });
        }

        $input.val(unique(current).join(','));
    } else {
        $input.val('');
    }
};

(function () {
    // Your base, I'm in it!
    var originalAddClassMethod = jQuery.fn.addClass;

    jQuery.fn.addClass = function () {
        // Execute the original method.
        var result = originalAddClassMethod.apply(this, arguments);

        // trigger a custom event
        jQuery(this).trigger('cssClassChanged');

        // return the original result
        return result;
    }
})();

jQuery(function ($) {
    // Attache click event to search button and show input fields
    $('.ezobject-relation-search-btn').click(_search).removeClass('hide');

    // Attache key press event to catch enter and show input fields
    $('input.ezobject-relation-search-text').keypress(function (e) {
        if (e.which == 13) {
            return _search.call(this, e);
        }
    }).removeClass('hide');

    // Function handling search event
    function _search(e) {
        e.preventDefault();
        var noResult = $(this).data('no_result');
        var box = $(this).parents('.relations-searchbox'), text = box.find('input.ezobject-relation-search-text');
        if (text.val()) {
            var params = {'CallbackID': box.attr('id'), 'EncodingFetchSection': 1};
            var node = box.find("*[name*='_for_object_start_node']"), classes = box.find("input[name*='_for_object_class_constraint_list']");
            if (node.size()) params['SearchSubTreeArray'] = node.val();
            if (classes.size()) params['SearchContentClassIdentifier'] = classes.val();
            $.ez('ezjsc::search::' + text.val(), params, function (data) {
                if (data && data.content !== '') {
                    var boxElem = $('ul.ezobject-relation-search-browse', box);
                    var close = $('<a class="close u-color-black" href="#" title="Chiudi risultati e torna al form di ricerca"><i class="fa fa-times"></i></a>');
                    close.bind('click', function (e) {
                        boxElem.empty().addClass('hide');
                        e.preventDefault();
                    });
                    if (data.content.SearchResultCount > 0) {
                        boxElem.empty();
                        boxElem.append(close);
                        var arr = data.content.SearchResult, pub = $('#ezobjectrelation-search-published-text');
                        for (var i = 0, l = arr.length; i < l; i++) {
                            var aElem = $('<a></a>');
                            aElem.bind('click', {
                                table: box.find('table'),
                                id: arr[i].id,
                                name: arr[i].name,
                                className: arr[i].class_name,
                                sectionName: arr[i].section.name,
                                publishedTxt: pub.val()
                            }, function (e) {
                                ezajaxrelationsSearchAddObject(this, $(e.currentTarget).parents('.relations-searchbox').find('table'), e.data.id, e.data.name, e.data.className, e.data.sectionName, e.data.publishedTxt);
                            });
                            aElem.append(arr[i].name);
                            aElem.attr('title', arr[i].path_identification_string);
                            var pElem = $("<li class='u-padding-all-xs u-margin-bottom-s'></li>");
                            pElem.append(aElem);
                            boxElem.append(pElem);
                        }
                        boxElem.removeClass('hide');
                    }
                    else {
                        var html = '<li class="u-padding-all-xs u-margin-bottom-s ezobjectrelation-search-empty-result">' + noResult.replace('--search-string--', '<em>' + data.content.SearchString + '<\/em>') + '<\/li>';
                        boxElem.html(html).removeClass('hide');
                    }
                }
                else {
                    alert(data.content.error_text);
                }
            });
        }
    }

    // function for selecting a search result object
    // @todo usare $.ez('ezjsctemplate::relation_list_row...)
    function _addObject(link, $table, id, name, className, sectionName, publishedTxt) {
        link.onclick = function () {
            return false;
        };
        link.className = 'disabled';
        var $baseTr = $('tbody tr.hide', $table);
        var countTr = $('tbody tr', $table).length;
        var tr = $baseTr.clone();
        tr.insertBefore($baseTr);
        var tds = $('td', tr).slice(0);
        tds.eq(0).find('input').val(id);
        tds.eq(1).html(name + ' <small>(' + className + ')</small>');
        tds.eq(2).find('small').html(sectionName);
        tds.eq(3).find('small').html(publishedTxt);
        tds.eq(4).find('input').val(countTr - 1);
        tr.removeClass('hide');
        $table.removeClass('hide');
        $table.parents().find('.ezobject-relation-remove-button').removeClass('hide');
        $table.parents().find('.ezobject-relation-no-relation').addClass('hide');
    }

    // register searchAdd gloablly as it is used on search links
    window.ezajaxrelationsSearchAddObject = _addObject;
});


$(document).ready(function () {

    if (typeof L == 'object') {
        L.NumberedDivIcon = L.Icon.extend({
            options: {
                iconUrl: 'http://cdn.leafletjs.com/leaflet/v0.7.7/images/marker-icon.png',
                number: '',
                shadowUrl: null,
                iconSize: new L.Point(25, 41),
                iconAnchor: new L.Point(13, 41),
                popupAnchor: new L.Point(0, -33),
                className: 'leaflet-div-icon'
            },

            createIcon: function () {
                var div = document.createElement('div');
                var img = this._createImg(this.options['iconUrl']);
                var numdiv = document.createElement('div');
                numdiv.setAttribute("class", "number");
                numdiv.innerHTML = this.options['number'] || '';
                div.appendChild(img);
                div.appendChild(numdiv);
                this._setIconStyles(div, 'icon');
                return div;
            },

            //you could change this to add a shadow like in the normal marker if you really wanted
            createShadow: function () {
                return null;
            }
        });
    }

    $("[data-gmap-attribute]").each(function () {

        // variables
        var $container = $(this);
        var attributeId = $container.data('gmap-attribute');
        var map;
        var userMarker = {
            "lat": 0,
            "lng": 0,
            "map": null,
            "marker": null,
            "markers": null,
            "geocoder": function () {
                //return new L.Control.Geocoder.Nominatim({geocodingQueryParams: this.address});
                return new L.Control.Geocoder.Nominatim();
            },
            "address": {
                "street": null,
//                        "house_number": null,
                "postcode": null,
                "state": null,
                "country": null,
                "county": null
            },
            "search": function (query, cb, context) {
                this.map.loadingControl.addLoader('sc');
                var that = this;
                this.geocoder().geocode(query, function (results) {
//                            console.log(results);
                    if (results.length > 0)
                        cb.call(context, results);
                    else {
                        var close = $('<a href="#">Riprova</a>');
                        close.bind('click', function (e) {
                            $container.find('.ezgml-search-results').empty().hide();
                            $container.find('.ezgml-form').show();
                            e.preventDefault();
                        });
                        $container.find('.ezgml-search-results').empty().append("<h4>Nessun risultato</h4><p>Riprova riducendo i parametri di ricerca oppure scrivendo l'indirizzo completo (ad esempio \"Corso Antonio Rosmini\, \"Via Giovanni Segantini\", ...)<p>").append(close);
                    }

                    that.map.loadingControl.removeLoader('sc');

                });
            },
            "text": null,
            "toQuery": function () {
                var parts = [];
                if (this.address.street) parts.push(this.address.street);
//                        if (this.address.house_number) parts.push(this.address.house_number);
                if (this.address.city) parts.push(this.address.city);
                if (this.address.state) parts.push(this.address.state);
                if (this.address.postcode) parts.push(this.address.postcode);
                if (this.address.country) parts.push(this.address.country);
                return parts.join(', ');
            },
            "init": function (map, lat, lng) {
                this.lat = lat || 0;
                this.lng = lng || 0;
                this.map = map;
                this.marker = new L.marker(
                    new L.latLng(this.lat, this.lng), {
                        icon: new L.MakiMarkers.icon({
                            icon: "star",
                            color: "#f00",
                            size: "l"
                        }),
                        draggable: true
                    }
                );
                var that = this;
                this.marker.on('dragend', function (event) {
                    var position = event.target.getLatLng();
                    that.moveIn(position.lat, position.lng);
                });
                this.markers = new L.markerClusterGroup();
                return this;
            },
            "reset": function () {
                if ($container.find('.ezgml_hidden_latitude').val().length) {
                    this.text = $container.find('.ezgml_hidden_address').val();
                    this.moveIn(
                        $container.find('.ezgml_hidden_latitude').val(),
                        $container.find('.ezgml_hidden_longitude').val()
                    );
                }
            },
            "resetMakers": function () {
                this.markers.clearLayers();
                return this;
            },
            "addMarker": function (marker, fit) {
                this.markers.addLayer(marker).addTo(this.map);
                if (fit) this.map.fitBounds(this.markers.getBounds());
                return this;
            },
            "fitBounds": function () {
                this.map.fitBounds(this.markers.getBounds());
                return this;
            },
            "moveIn": function (lat, lng) {
                this.lat = lat || 0;
                this.lng = lng || 0;
                var latLng = new L.latLng(this.lat, this.lng);
                this.marker.setLatLng(latLng);
                this.resetMakers().addMarker(this.marker, true);
                this.map.loadingControl.addLoader('sc');
                var that = this;
                this.geocoder().reverse(latLng, 1, function (result) {
//                            console.log(result);
                    that.map.loadingControl.removeLoader('sc');
                    $container.find('.ezgml-form-fields p').remove();
                    $container.find('.ezgml-form input').val('');
                    if (result[0].properties) {
                        that.address = $.extend({}, {street: that.address.street}, result[0].properties.address);
                        $.each(that.address, function (index, value) {
                            if ($container.find("[name='" + index + "']").length > 0) {
                                $container.find("[name='" + index + "']").val(value);
                            } else {
                                $container.find('.ezgml-form-fields').append('<p class="hide"><small class="key">' + index + ':</small><small>' + value + '</small></p>');
                            }
                        });
                        if (that.text == null) {
                            that.text = result[0].name;
                        }
                    }
                    $container.find('.ezgml_new_address').val(that.text);
                    $container.find('.ezgml_new_latitude').val(that.lat);
                    $container.find('.ezgml_new_longitude').val(that.lng);

                });
                return this;
            }
        };

        // init map
        map = new L.Map('edit-map-' + attributeId, {loadingControl: true});
        //map.scrollWheelZoom.disable();
        L.tileLayer('//{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(map);
        map.setView(new L.latLng(0, 0), 1);

        $('.ui-tabs .border-content').bind('tabsshow', function (event, ui) {
            map.invalidateSize();
        });

        if ($('a[data-toggle="tab"]').length > 0) {
            $('a[data-toggle="tab"]').bind('shown.bs.tab', function (e) {
                map.invalidateSize(false);
            });
        }
        else if ($(".ui-tabs .ui-tabs-nav").length > 0) {
            $(".ui-tabs .ui-tabs-panel").bind("cssClassChanged", function (event, ui) {
                map.invalidateSize(false);
            });
        }

        // init userMarker
        userMarker.init(map);

        // popola il marker in base alle coordinate esistenti
        userMarker.reset();

        $container.find('.ezgml-form input').bind('keypress', function (e) {
            if (e.which == 13) {
                $container.find("[name='GeoSearch']").trigger('click');
                e.preventDefault();
            }
        });

        // esegue il form di ricerca
        $container.find("[name='GeoSearch']").bind('click', function (e) {
            var query = null;
            $container.find('.ezgml-form input').each(function (i, v) {
                var input = $(v);
                if (input.attr('name') == 'query')
                    query = input.val();
                else
                    userMarker.address[input.attr('name')] = input.val();
            });
            query = userMarker.toQuery();
            $container.find("[name='query']").val(query);
            userMarker.search(query, function (results) {
                userMarker.text = query;
                userMarker.resetMakers();
                $container.find('.ezgml-form-fields p').remove();
                if (results.length) {
                    var markers = {};
                    var list = $('<div/>');

                    var close = $('<a class="close u-color-black" href="#" title="Chiudi risultati e torna al form di ricerca"><i class="fa fa-times"></i></a>');
                    close.bind('click', function (e) {
                        $container.find('.ezgml-search-results').empty().hide();
                        $container.find('.ezgml-form').show();
                        e.preventDefault();
                    });
                    list.append(close);

                    if (results.length > 1) {
                        $.each(results, function (index, result) {
                            var number = index + 1;
                            var latLng = new L.latLng(result.center.lat, result.center.lng);
                            var marker = new L.marker(latLng, {icon: new L.NumberedDivIcon({number: number})});
                            marker.on('click', function (e) {
                                if (e.latlng !== undefined) {
                                    userMarker.moveIn(e.latlng.lat, e.latlng.lng);
                                    $container.find('.ezgml-search-results').empty().hide();
                                    $container.find('.ezgml-form').show();
                                }
                            });
                            markers[index] = marker;
                            userMarker.addMarker(marker, false);
                            var icon = $('<div class="leaflet-marker-icon"><img src="http://cdn.leafletjs.com/leaflet/v0.7.7/images/marker-icon.png"><div class="number">' + number + '</div></div>');
                            list.append(
                                $('<p class="u-text-xs u-nbfc u-padding-top-s"/>')
                                    .append(icon)
                                    .append(result.name)
                                    .css({"cursor": 'pointer'})
                                    .bind('click', function () {
                                        userMarker.markers.zoomToShowLayer(marker,
                                            function () {
                                                marker.fire('click');
                                            }
                                        );
                                    })
                            );
                        });
                        $container.find('.ezgml-search-results').empty().append(list);
                    } else {
                        userMarker.moveIn(results[0].center.lat, results[0].center.lng);
                        $container.find('.ezgml-search-results').empty().hide();
                        $container.find('.ezgml-form').show();
                    }
                    userMarker.fitBounds();
                }
            });
            $container.find('.ezgml-form').hide();
            $container.find('.ezgml-search-results').show().append('<p>Attendere caricamento ...</p>');
            e.preventDefault();
        });

        // intercetta il click dell'utente sulla mappa
        map.on('click', function (e) {
            userMarker.moveIn(e.latlng.lat, e.latlng.lng);
            $container.find('.ezgml-search-results').empty().hide();
            $container.find('.ezgml-form').show();
        });

        // intercetta il MyLocation
        $container.find("[name='MyLocation']").bind('click', function (e) {
            map.loadingControl.addLoader('lc');
            map.locate({setView: true, watch: false})
                .on('locationfound', function (e) {
                    map.loadingControl.removeLoader('lc');
                    userMarker.address.street = null;
                    userMarker.text = null;
                    userMarker.moveIn(e.latitude, e.longitude);
                })
                .on('locationerror', function (e) {
                    map.loadingControl.removeLoader('lc');
                    alert(e.message);
                });
            e.preventDefault();
        });

        // intercetta il Reset
        $container.find("[name='Reset']").bind('click', function (e) {
            userMarker.address.street = null;
            userMarker.reset();
            e.preventDefault();
        });

    });
});
