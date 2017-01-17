{if is_set( $event.from )}
    {def $from = $event.from|datetime( 'custom', '%M' )
         $to = $event.from|datetime( 'custom', '%j' )
         $sameDay = cond($item.to|sub($item.from)|le(86400), true(), false())}
{else}
    {def $from = $node.data_map.from_time.content.timestamp|datetime( 'custom', '%M' )
         $to = $node.data_map.from_time.content.timestamp|datetime( 'custom', '%j' )
         $sameDay = cond($item.data_map.to_time.content.timestamp|sub($item.data_map.from_time.content.timestamp)|le(86400), true(), false())}
{/if}

<div class="openpa-panel {$node|access_style}">

    {include uri='design:openpa/panel/parts/image.tpl'}

    <div class="Card-content u-padding-r-all">

        {if is_set($is_program)}
            <p class="Card-title">
                <a class="Card-titleLink" href="{$openpa.content_link.full_link}"
                   title="{$node.name|wash()}">{$node.name|wash()}</a>
            </p>
        {else}
            <div class="Grid Grid--withGutter">
                <div class="Grid-cell u-md-size2of4 u-lg-size2of4">
                    <div class="calendar-date">
                        <span class="month">{$from}</span>
                        <span class="day">{if $sameDay|not()}<small>dal </small>{/if}{$to}</span>
                    </div>
                </div>
                <div class="Grid-cell u-md-size2of4 u-lg-size2of4">
                    <p class="Card-title">
                        <a class="Card-titleLink" href="{$openpa.content_link.full_link}"
                           title="{$node.name|wash()}">{$node.name|wash()}</a>
                    </p>
                </div>
            </div>
        {/if}

        <div class="Card-text">

            {if $node|has_attribute( 'indirizzo' )}
                <p>{attribute_view_gui attribute=$node.data_map.indirizzo}</p>
            {/if}
            {if $node|has_attribute( 'luogo_svolgimento' )}
                <p>{attribute_view_gui attribute=$node.data_map.luogo_svolgimento}</p>
            {/if}
            {if $node|has_attribute( 'comune' )}
                <p>{attribute_view_gui attribute=$node.data_map.comune}</p>
            {/if}

            {$node|abstract()|oc_shorten(250)}

        </div>


    </div>

    <a class="readmore" href="{object_handler($node).content_link.full_link}" title="{$node.name|wash()}">Leggi</a>

</div>
