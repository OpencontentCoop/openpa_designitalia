{if is_set( $event.from )}
    {def $from = $event.from|datetime( 'custom', '%M' )
    $to = $event.from|datetime( 'custom', '%j' )}
{else}
    {def $from = $node.data_map.from_time.content.timestamp|datetime( 'custom', '%M' )
    $to = $node.data_map.from_time.content.timestamp|datetime( 'custom', '%j' )}
{/if}

<section class="openpa-panel {$node|access_style} Card Card--withBorder u-color-grey-30">

    {if $node|has_attribute('image')}
        <div class="Card-image">
            <img src="{$node|attribute('image').content.imagefull.full_path|ezroot(no)}" class="u-sizeFull">
        </div>
    {/if}

    <div class="Card-content u-padding-r-all">
        <p class="Card-title">
            <a class="Card-titleLink" href="{$openpa.content_link.full_link}"
               title="{$node.name|wash()}">{$node.name|openpa_shorten(60)|wash()}</a>
        </p>

        {if is_set($is_program)|not()}

        <div class="Grid">
            <div class="GridCell u-size1of4">{include uri='design:parts/calendar_date.tpl' month=$from day=$to}</div>
            <div class="GridCell u-size3of4">
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

</section>
