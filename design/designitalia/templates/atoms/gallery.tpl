{* https://github.com/blueimp/Gallery vedi anche page_extra.tpl *}
{ezscript_require( array( "ezjsc::jquery", "plugins/blueimp/jquery.blueimp-gallery.min.js" ) )}
{ezcss_require( array( "plugins/blueimp/blueimp-gallery.css" ) )}

{set_defaults( hash(
    'thumbnail_class', 'squarethumb',
    'wide_class', 'imagefullwide',
    'items', array(),
    'all_items_count', 0,
    'readmore_link', false(),
    'fluid', false(),
    'mode', 'strip'
))}

<div class="gallery gallery-{$mode} Navscroll Navscroll--withHint">
    {if $title}
        <h2>{$title}</h2>
    {/if}

    {def $height = 0}

    <ul>
        {foreach $items as $item}

            {def $caption=$item.name}
            {if $item|has_attribute( 'caption' )}
                {set $caption = $item.data_map.caption.data_text|oc_shorten(200)|wash()}
            {/if}
            <li class="u-alignMiddle">
                {if $height|eq(false())}
                    {set $height = $item|attribute('image').content[$thumbnail_class].height}
                {/if}

                <a class="gallery-strip-thumbnail"
                   href={$item|attribute('image').content[$wide_class].url|ezroot} title="{$caption}" data-gallery
                   style="display: inline-block;margin: 10px;">
                    {attribute_view_gui attribute=$item|attribute('image') image_class=$thumbnail_class fluid=$fluid}
                </a>
            </li>
            {undef $caption}
        {/foreach}

        {if and( $readmore_link, sub($all_items_count, count($items))|gt(0))}
            <li class="u-alignMiddle">
                <a href="{$readmore_link}" style="line-height: {$height}px;display: inline-block; margin: 10px; padding: 0px 10px;" class="u-linkClean u-color-grey-30 u-text-h3 u-border-all-xxs">
                    <i class="fa fa-plus"></i> {sub($all_items_count, count($items))}
                </a>
            </li>
        {/if}

    </ul>
</div>