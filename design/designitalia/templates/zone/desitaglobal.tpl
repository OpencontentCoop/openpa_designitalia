{def $persistent_variable = ezpagedata().persistent_variable}

<div class="frontpage">
    {if and( is_set( $zones[0].blocks ), $zones[0].blocks|count() )}
        {foreach $zones[0].blocks as $block}

            {if or( $block.valid_nodes|count(),
                and( is_set( $block.custom_attributes), $block.custom_attributes|count() ),
                and( eq( ezini( $block.type, 'ManualAddingOfItems', 'block.ini' ), 'disabled' ), ezini_hasvariable( $block.type, 'FetchClass', 'block.ini' )|not ) )}

                {def $current_items_per_row = 3}
                {if ezini_hasvariable( $block.type, 'ItemsPerRow', 'block.ini' )}
                    {def $current_items_per_row_settings = ezini( $block.type, 'ItemsPerRow', 'block.ini' )}
                    {if is_set($current_items_per_row_settings[$block.view])}
                        {set $current_items_per_row = $current_items_per_row_settings[$block.view]}
                    {/if}
                    {undef $current_items_per_row_settings}
                {/if}

                {if $block.view|ends_with('_wide')}
                    <div class="Grid-cell u-sizeFull wide">
                        {block_view_gui block=$block items_per_row=$current_items_per_row link_top_title=false()}
                    </div>
                {else}
                    <div class="{if and(is_set($block.custom_attributes.color_style), $block.custom_attributes.color_style|ne(''))}u-background-grey-20 u-padding-r-top u-padding-r-bottom{/if}">
                        <section {if is_set($persistent_variable.has_container)}class="u-layout-wide u-layoutCenter u-layout-r-withGutter"{/if}>
                            <div class="Grid Grid--withGutter">
                                <div class="Grid-cell u-sizeFull">
                                    {block_view_gui block=$block items_per_row=$current_items_per_row link_top_title=false()}
                                </div>
                            </div>
                        </section>
                    </div>
                {/if}

                {undef $current_items_per_row}

            {else}
                {skip}
            {/if}
        {/foreach}
    {/if}
</div>
{undef $persistent_variable}
