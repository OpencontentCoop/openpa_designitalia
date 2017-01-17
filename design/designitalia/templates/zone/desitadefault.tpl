{ezpagedata_set( 'has_container', true() )}


<div class="frontpage">
    <div class="Grid-cell u-sizeFull">
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

    <div class="u-layout-wide u-layoutCenter u-text-r-xl u-layout-r-withGutter u-padding-r-top">
        <div class="Grid-cell u-sizeFull u-md-size4of12 u-lg-size4of12">
            {if and( is_set( $zones[1].blocks ), $zones[1].blocks|count() )}
            {foreach $zones[1].blocks as $block}
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
        <div class="Grid-cell u-sizeFull u-md-size4of12 u-lg-size4of12">
            {if and( is_set( $zones[3].blocks ), $zones[3].blocks|count() )}
                {foreach $zones[3].blocks as $block}
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

    {if and( is_set( $zones[4].blocks ), $zones[4].blocks|count() )}
        <div class="u-background-grey-30 u-layout-centerContent u-padding-r-top">
            <section class="u-layout-wide u-text-r-s u-padding-r-top u-padding-r-bottom">
                <div class="Grid Grid--withGutter">
                    <div class="Grid-cell u-sizeFull">
                        {foreach $zones[4].blocks as $block}
                        {if or( $block.valid_nodes|count(),
                            and( is_set( $block.custom_attributes), $block.custom_attributes|count() ),
                            and( eq( ezini( $block.type, 'ManualAddingOfItems', 'block.ini' ), 'disabled' ), ezini_hasvariable( $block.type, 'FetchClass', 'block.ini' )|not ) )}
                            {block_view_gui block=$block items_per_row=3}
                        {else}
                            {skip}
                        {/if}
                        {/foreach}
                    </div>
                </div>
            </section>
        </div>
    {/if}

    <div class="u-layout-wide u-layoutCenter u-text-r-xl u-layout-r-withGutter u-padding-r-top">
        <div class="Grid-cell u-sizeFull u-md-size3of12 u-lg-size3of12">
            {if and( is_set( $zones[5].blocks ), $zones[5].blocks|count() )}
                {foreach $zones[5].blocks as $block}
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
        <div class="Grid-cell u-sizeFull u-md-size3of12 u-lg-size3of12">
            {if and( is_set( $zones[6].blocks ), $zones[6].blocks|count() )}
                {foreach $zones[6].blocks as $block}
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
        <div class="Grid-cell u-sizeFull u-md-size3of12 u-lg-size3of12">
            {if and( is_set( $zones[7].blocks ), $zones[7].blocks|count() )}
                {foreach $zones[7].blocks as $block}
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
        <div class="Grid-cell u-sizeFull u-md-size3of12 u-lg-size3of12">
            {if and( is_set( $zones[8].blocks ), $zones[8].blocks|count() )}
                {foreach $zones[8].blocks as $block}
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


</div>