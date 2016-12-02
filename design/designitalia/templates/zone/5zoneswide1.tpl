<div class="Grid Grid--withGutter frontpage first">
    <div class="Grid-cell u-sizeFull">
        {if and( is_set( $zones[0].blocks ), $zones[0].blocks|count() )}
            {foreach $zones[0].blocks as $block}
                {if or( $block.valid_nodes|count(),
                and( is_set( $block.custom_attributes), $block.custom_attributes|count() ),
                and( eq( ezini( $block.type, 'ManualAddingOfItems', 'block.ini' ), 'disabled' ), ezini_hasvariable( $block.type, 'FetchClass', 'block.ini' )|not ) )}
                    {block_view_gui block=$block items_per_row=1 show_items_preview=0 image_class='agid_wide_carousel' enable_pagination=true() enable_preview=false()}
                {else}
                    {skip}
                {/if}
            {/foreach}
        {/if}
    </div>
</div>

<div class="Grid Grid--withGutter frontpage">
    
    <div class="Grid-cell u-sizeFull u-md-size8of12 u-lg-size8of12">
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
    
    <div class="Grid-cell u-sizeFull u-md-size4of12 u-lg-size4of12">
    
    {if and( is_set( $zones[2].blocks ), $zones[2].blocks|count() )}
    {foreach $zones[2].blocks as $block}
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
</div>

<div class="Grid Grid--withGutter frontpage bg-color u-padding-top-s u-padding-bottom-s">
    <div class="Grid-cell u-sizeFull">
        {if and( is_set( $zones[3].blocks ), $zones[3].blocks|count() )}
        {foreach $zones[3].blocks as $block}
        {if or( $block.valid_nodes|count(), 
            and( is_set( $block.custom_attributes), $block.custom_attributes|count() ), 
            and( eq( ezini( $block.type, 'ManualAddingOfItems', 'block.ini' ), 'disabled' ), ezini_hasvariable( $block.type, 'FetchClass', 'block.ini' )|not ) )}
            {block_view_gui block=$block items_per_row=3}
        {else}
            {skip}
        {/if}
        {/foreach}
        {/if}
    </div>
</div>

<div class="Grid Grid--withGutter frontpage">
    <div class="Grid-cell u-sizeFull">
        {if and( is_set( $zones[4].blocks ), $zones[4].blocks|count() )}
            {foreach $zones[4].blocks as $block}
                {if or( $block.valid_nodes|count(),
                and( is_set( $block.custom_attributes), $block.custom_attributes|count() ),
                and( eq( ezini( $block.type, 'ManualAddingOfItems', 'block.ini' ), 'disabled' ), ezini_hasvariable( $block.type, 'FetchClass', 'block.ini' )|not ) )}
                    {block_view_gui block=$block items_per_row=4}
                {else}
                    {skip}
                {/if}
            {/foreach}
        {/if}
    </div>
</div>