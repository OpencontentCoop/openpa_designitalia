{* $attribute var is required *}

{def $defaults = ezini( 'DefaultSettings', 'Settings', 'ocmediaplayer.ini' )}

{if $attribute.content.is_autoplay}
    {def $is_autoplay = true()}
{else}
    {def $is_autoplay = $defaults.is_autoplay|eq( 'enabled' )}
{/if}

{if $attribute.content.is_loop}
    {def $is_loop = true()}
{else}
    {def $is_loop = $defaults.is_loop|eq( 'enabled' )}
{/if}

{if $attribute.content.has_controller}
    {def $has_controller = true()}
{else}
    {def $has_controller = $defaults.has_controller|eq('enabled')}
{/if}


{def $identifiers = ezini( 'AttributeIdentifiers', 'Identifier', 'ocmediaplayer.ini' )
     $object = $attribute.object
     $file = concat("content/download/",$attribute.contentobject_id,"/",$attribute.content.contentobject_attribute_id,"/",$attribute.content.original_filename)|ezurl
     $cover = false()}

{foreach $identifiers as $key => $identifier}
    {switch match=$key}
        {case match='cover'}
            {if and( is_set( $object.data_map.$identifier ), $object.data_map.$identifier.data_type_string|eq( 'ezimage' ), $object.data_map.$identifier.has_content )}
                {set $cover = $object.data_map.$identifier}
            {/if}
        {/case}
        {case}{/case}
    {/switch}
{/foreach}

<audio controls>
    <source src="{concat( "content/download/", $attribute.contentobject_id, "/", $attribute.content.contentobject_attribute_id, "/", $attribute.content.original_filename)|ezurl( 'no' )}"
            type="{$attribute.content.mime_type}">
    <div class="audio">
        <a	class="player no-js-hide"
            href={concat("content/download/",$attribute.contentobject_id,"/",$attribute.content.contentobject_attribute_id,"/",$attribute.content.original_filename)|ezurl}
            style="display:block;width:100%px;height:30px;"
            title="{$object.name|wash()}"
            id="audio-{$attribute.contentobject_id}">
        </a>
    </div>
</audio>

{ezscript_require(array( 'ezjsc::jquery', ocmp('flowplayer','js') ) )}
{ezcss_require( 'controls-audio.css' )}
<script>
$(document).ready(function(){ldelim}
    flowplayer("audio-{$attribute.contentobject_id}", {ocmp('flowplayer','flash')},
    {ldelim}
        clip:
            {ldelim}
            {if $is_autoplay}autoPlay:true{else}autoPlay:false{/if}
            {rdelim},
        plugins:
            {ldelim}
                controls: {ldelim}
                    fullscreen: false,
                    height: 30,
                    autoHide: false
                {rdelim},
                audio: {ldelim}
                    url: {ocmp('audio','flash')},
                    provider: 'audio',
                {rdelim},
            {rdelim}
    {rdelim});
{rdelim})
</script>


{undef}
