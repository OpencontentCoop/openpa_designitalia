var OpenpaAgendaHelpers = $.extend({}, $.opendataTools.helpers, {
    'agendaUrl': function (id) {
        return $.opendataTools.settings('accessPath') + '/content/view/full/' + id;
    }
});
