{if is_set( $event.from )}
    {def $from = $event.from|datetime( 'custom', '%M' )
    $to = $event.from|datetime( 'custom', '%j' )}
{else}
    {def $from = $node.data_map.from_time.content.timestamp|datetime( 'custom', '%M' )
    $to = $node.data_map.from_time.content.timestamp|datetime( 'custom', '%j' )}
{/if}

<div class="openpa-panel {$node|access_style}">

    {include uri='design:openpa/panel/parts/image.tpl'}

    <div class="Card-content u-padding-r-all">
        <p class="Card-title">
            <a class="Card-titleLink" href="{$openpa.content_link.full_link}"
               title="{$node.name|wash()}">{$node.name|wash()}</a>
        </p>

        {if is_set($is_program)|not()}

        <div class="Grid Grid--withGutter">
            <div class="Grid-cell u-md-size1of4 u-lg-size1of4">
                <div class="calendar-date">
                    <span class="month">{$from}</span>
                    <span class="day">{$to}</span>
                </div>
            </div>
            <div class="Grid-cell u-md-size3of4 u-lg-size3of4">
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

            {$node|abstract()}

        </div>

        {if is_set($is_program)|not()}
            </div>
        </div>
        {/if}

    </div>

    <a class="readmore" href="{object_handler($node).content_link.full_link}" title="{$node.name|wash()}">Leggi</a>

</div>
