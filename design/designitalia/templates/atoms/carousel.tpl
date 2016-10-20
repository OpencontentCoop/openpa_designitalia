{set_defaults( hash(
    'i_view', 'carousel',
    'items', array(),
    'autoplay', 0,
    'items_per_row', 1,
    'image_class', 'carousel',
    'navigation', true(),
    'pagination', false(),
    'auto_height', true(),
    'top_pagination_position', false(),
    'navigation_text', concat( "['", '<i class="fa fa-arrow-circle-left"></i>', "','", '<i class="fa fa-arrow-circle-right"></i>', "']"),
    'css_id', $root_node.node_id
))}

{if and( $root_node, $items )}
    {if $root_node}

    <div id="carousel_{$css_id}" class="owl-carousel">
        {foreach $items as $item}            
            <div class="item">
                {node_view_gui content_node=$item view=$i_view image_class=$image_class items_per_row=$items_per_row}
            </div>
        {/foreach}
    </div>

    <script type="text/javascript">
        $(document).ready(function() {ldelim}
            $("#carousel_{$css_id}").owlCarousel({ldelim}
                items : {$items_per_row},
                itemsDesktop : [1000,{$items_per_row}], // items between 1000px and 901px
                itemsDesktopSmall : [900,{$items_per_row}], // betweem 900px and 601px
                itemsTablet: [600,{$items_per_row}], // items between 600 and 0
                itemsMobile : [400,1],
                autoPlay: false, // http://design.italia.it/linee-guida/layout/carousel/
                navigation: {cond( $navigation|gt(0), 'true', 'false')},
                pagination: {cond( $pagination|gt(0), 'true', 'false')},
                autoHeight : {if $auto_height}true{else}false{/if},
                navigationText: {cond( $navigation_text|ne(false()), $navigation_text, false )}
                {if $top_pagination_position},afterInit : function(elem){ldelim}var that = this;that.owlControls.prependTo(elem){rdelim}{/if}
                {rdelim});
            {rdelim});
    </script>


    {/if}

{unset_defaults( array('i_view','items','autoplay','items_per_row', 'image_class','navigation','pagination','navigation_text','css_id'))}


