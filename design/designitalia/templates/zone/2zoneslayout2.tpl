<div class="Grid Grid--withGutter frontpage">
    
    <div class="Grid-cell u-sizeFull u-md-size4of12 u-lg-size4of12">
        {if and( is_set( $zones[0].blocks ), $zones[0].blocks|count() )}
        {foreach $zones[0].blocks as $block}
        {if or( $block.valid_nodes|count(), 
            and( is_set( $block.custom_attributes), $block.custom_attributes|count() ), 
            and( eq( ezini( $block.type, 'ManualAddingOfItems', 'block.ini' ), 'disabled' ), ezini_hasvariable( $block.type, 'FetchClass', 'block.ini' )|not ) )}
            {block_view_gui block=$block items_per_row=1}
        {else}
            {skip}
        {/if}        
        {/foreach}
        {/if}
    
    </div>
    
    <div class="Grid-cell u-sizeFull u-md-size4of12 u-lg-size4of12">
    
    {if and( is_set( $zones[1].blocks ), $zones[1].blocks|count() )}
    {foreach $zones[1].blocks as $block}
    {if or( $block.valid_nodes|count(), 
        and( is_set( $block.custom_attributes), $block.custom_attributes|count() ), 
        and( eq( ezini( $block.type, 'ManualAddingOfItems', 'block.ini' ), 'disabled' ), ezini_hasvariable( $block.type, 'FetchClass', 'block.ini' )|not ) )}
        {block_view_gui block=$block items_per_row=2}
    {else}
        {skip}
    {/if}
    {/foreach}
    {/if}
    
    </div>

</div>