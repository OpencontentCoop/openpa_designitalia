{literal}
    <script type="text/javascript">
        WebFontConfig = {
            google: {
                families: ['Titillium+Web:400,700,400italic:latin']
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
'ezjsc::jquery'
))}

<!-- include html5shim per Explorer 8 -->
<script src="{'javascript/modernizr.js'|ezdesign(no)}"></script>



<script type="text/javascript">{literal}//<![CDATA[
var UiContext = {/literal}"{$ui_context}"{literal}, UriPrefix = {/literal}{'/'|ezurl()}{literal}, PathArray = [{/literal}{if is_set( $pagedata.path_array[0].node_id )}{foreach $pagedata.path_array|reverse as $path}{$path.node_id}{delimiter},{/delimiter}{/foreach}{/if}{literal}];
//]]>{/literal}</script>
