{literal}
<script>
    WebFontConfig = {
        google: {
            families: ['Titillium+Web:200,200i,300,300i,400,400i,600,600i&subset=latin-ext']
        }
    };
    (function() {
        var wf = document.createElement('script');
        wf.src = 'https://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
        wf.type = 'text/javascript';
        wf.async = 'true';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(wf, s);
    })();
</script>
{/literal}
{ezscript_load( array(
    'ezjsc::jquery',
    'ezjsc::jqueryUI',
    'ezjsc::jqueryio',
    'menu.js',
    'vendor/owl.carousel.min.js',
    'plugins/init_carousel.js',
    'plugins/blueimp/jquery.blueimp-gallery.min.js'
))}
<!-- include html5shim per Explorer 8 -->
<script src="{'javascript/vendor/modernizr.js'|ezdesign(no)}"></script>
<!-- youtube embed fix -->
{literal}<script>$(document).ready(function(){$("iframe[src*='youtube']").each(function(){var width = $(this).attr('width');var height = $(this).attr('height');var parent = $(this).parent();if (parent.css('overflow') == 'hidden' && width > 0 && height > 0){parent.css('padding-bottom', parseFloat(height / width * 100) + '%');}})});</script>{/literal}
