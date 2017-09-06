{def $openpa = object_handler($block)
     $bg_class = 'u-background-grey-20'
     $count = $openpa.content|count()
     $size = 2}

{if and(is_set($block.custom_attributes.color_style), $block.custom_attributes.color_style|ne(''))}
    {set $bg_class = 'u-background-white'}
{/if}
{set_defaults(hash('show_title', true()))}


{for 4 to 2 as $counter}
    {if $count|mod($counter)|eq(0)}
        {set $size = $counter}
        {break}
    {/if}
{/for}

{if count($openpa.content)|gt(0)}
<div class="openpa-widget {$block.view} {if and(is_set($block.custom_attributes.color_style), $block.custom_attributes.color_style|ne(''))}color color-{$block.custom_attributes.color_style}{/if}">
    {if and( $show_title, $block.name|ne('') )}
        <h3 class="openpa-widget-title">{if and($openpa.root_node, $link_top_title)}<a href={$openpa.root_node.url_alias|ezurl()}>{/if}{$block.name|wash()}{if and($openpa.root_node, $link_top_title)}</a>{/if}</h3>
    {/if}
    <div class="openpa-widget-content">
        <div class="Grid Grid--withGutter">
            {foreach $openpa.content as $item}
                <div class="Grid-cell u-md-size1of{$size} u-lg-size1of{$size} u-padding-bottom-s">
                    <a class="u-sizeFull u-textClean u-text-m {$bg_class} u-floatLeft" href="{$item.url_alias|ezurl(no)}" style="height: 120px; overflow: hidden">
                        {if $item|has_attribute('image')}
                            <img src="{$item|attribute('image').content['agid_square'].full_path|ezroot(no)}" alt="" class="u-margin-right-xs u-floatLeft" height="120" />
                        {/if}
                        <span class="u-block u-padding-all-l">{$item.name|oc_shorten(120)}</span>
                    </a>
                </div>
            {/foreach}
        </div>
    </div>
    {if and($openpa.root_node, $link_top_title|not())}
        <p class="u-textCenter u-text-md-right u-text-lg-right u-margin-r-top">
            <a href="{$openpa.root_node.url_alias|ezurl(no)}" class="u-color-50 u-textClean u-text-h4">
                Vedi tutto <span class="Icon Icon-chevron-right"></span></a>
        </p>
    {/if}
</div>
{/if}
