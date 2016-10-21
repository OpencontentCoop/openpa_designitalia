(function ($, window, document, undefined) {
    "use strict";
    var pluginName = "initOwlCarousel";

    function InitOwlCarousel(container, options, showPreview) {
        var owl = $(container);
        owl.owlCarousel(options);
        if (showPreview) {
            owl.on('changed.owl.carousel', function (e) {
                $(e.target).find('[data-index]').removeClass('active').find('a').removeClass('focus');
                $(e.target).find('[data-index="' + e.item.index + '"]').addClass('active').find('a').addClass('focus');
            });

            var previewContainer = $('<div class="owl-preview-container" />');
            var preview = $('<ul class="owl-preview" />');
            owl.find('.carousel-caption h3').each(function (index) {
                var item = $('<li data-index="' + index + '" />');
                var link = $($(this).html());
                link.bind('click', function (event) {
                    owl.trigger('to.owl.carousel', [index, 250, true]);
                    event.preventDefault();
                });
                if (index == 0) {
                    item.addClass('active');
                    link.addClass('focus');
                }
                preview.append(item.append(link));
            });

            preview.appendTo(previewContainer);
            previewContainer.appendTo(owl);
        }

    }

    $.fn[pluginName] = function (options, showPreview) {
        return this.each(function () {
            if (!$.data(this, pluginName)) {
                $.data(this, pluginName, new InitOwlCarousel(this, options, showPreview));
            }
        });
    };

})(jQuery, window, document);

