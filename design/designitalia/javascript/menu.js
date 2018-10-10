$(document).ready(function () {
    $('.Megamenu-list a[data-node], .Offcanvas a[data-node]').each(function () {
        if ($.inArray($(this).data('node'), PathArray) > -1) {
            $(this).addClass('current');
            //$(this).parents('li').addClass('current');
        }
        //if (UiContext == 'browse') {
        //    href = '/content/browse/' + $(this).data('node');
        //}
    });
    $("iframe[src*='youtube']").each(function () {
        var width = $(this).attr('width');
        var height = $(this).attr('height');
        var parent = $(this).parent();
        if (parent.css('overflow') == 'hidden' && width > 0 && height > 0) {
            parent.css('padding-bottom', parseFloat(height / width * 100) + '%');
        }
    });
});