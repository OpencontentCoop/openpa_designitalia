{def $openpa= object_handler($block)}
{set_defaults(hash('show_title', true()))}

<div class="openpa-widget {$block.view} {if is_set($block.custom_attributes.color_style)}color color-{$block.custom_attributes.color_style}{/if}">
    {if and( $show_title, $block.name|ne('') )}
        <h3 class="openpa-widget-title">
            {if $openpa.root_node}<a href={$openpa.root_node.url_alias|ezurl()}>{/if}
                {$block.name|wash()}
            {if $openpa.root_node}</a>{/if}
        </h3>
    {/if}
    <div class="openpa-widget-content">
        <ul class="Linklist Prose u-text-r-xs">
            {foreach $openpa.content as $item}
                {node_view_gui content_node=$item view=text_linked}
            {/foreach}
            <li>
                <a href="{$openpa.root_node.url_alias|ezurl(no)}" class="u-textClean">tutt su “{$block.name|wash()}” <span class="Icon Icon-chevron-right"></span></a>
            </li>
        </ul>
    </div>
</div>
{unset_defaults( array('show_title') )}


{*<div class="u-sizeFull u-color-70 u-text-r-s u-padding-r-left u-padding-r-right">
    <h3 class="u-border-bottom-m">
        <a href="#" class="u-block u-text-h3 u-color-60 u-textClean">Servizi
            <!-- <span class="u-text-r-s Icon Icon-chevron-right"></span> -->
        </a></h3>
    <ul class="Linklist Prose u-text-r-xs">
        <li><a href="">Modulistica</a></li>
        <li><a href="">SUAP</a></li>
        <li><a href="">Iscrizioni scolastiche</a></li>
        <li><a href="">Tributi e sanzioni</a></li>
        <li><a href="page--servizi" class="u-color-50 u-textClean">
                tutti i servizi <span class="Icon Icon-chevron-right"></span></a></li>
    </ul>
</div>*}
