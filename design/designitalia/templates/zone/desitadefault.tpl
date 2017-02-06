{def $wide = array('lista_in_evidenza', 'eventi_wide')}

<div class="frontpage">
    {for 0 to 8 as $counter}
        {if and( is_set( $zones[$counter].blocks ), $zones[$counter].blocks|count() )}
            {foreach $zones[$counter].blocks as $block}

                {if or( $block.valid_nodes|count(),
                and( is_set( $block.custom_attributes), $block.custom_attributes|count() ),
                and( eq( ezini( $block.type, 'ManualAddingOfItems', 'block.ini' ), 'disabled' ), ezini_hasvariable( $block.type, 'FetchClass', 'block.ini' )|not ) )}

                    {if $wide|contains($block.view)}
                        <div class="Grid-cell u-sizeFull">
                            {block_view_gui block=$block items_per_row=1 link_top_title=false()}
                        </div>
                    {else}
                        <div {if and(is_set($block.custom_attributes.color_style), $block.custom_attributes.color_style|ne(''))}class="u-background-grey-20 u-padding-r-top u-padding-r-bottom"{/if}>
                            <section class="u-layout-wide u-layoutCenter u-layout-r-withGutter">
                                <div class="Grid Grid--withGutter">
                                    <div class="Grid-cell u-sizeFull">
                                        {block_view_gui block=$block items_per_row=3 link_top_title=false()}
                                    </div>
                                </div>
                            </section>
                        </div>
                    {/if}

                {else}
                    {skip}
                {/if}
            {/foreach}
        {/if}
    {/for}
</div>
