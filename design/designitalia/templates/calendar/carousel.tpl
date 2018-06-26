{set_defaults( hash(
'i_view', 'carousel',
'items', array(),
'autoplay', 0,
'items_per_row', 1,
'image_class', 'carousel',
'navigation', true(),
'pagination', false(),
'auto_height', false(),
'top_pagination_position', false(),
'navigation_text', concat( "['", '<span class="u-alignMiddle Icon Icon-arrow-left" role="presentation"></span>', "','", '<span class="u-alignMiddle Icon Icon-arrow-right" role="presentation"></span>', "']"),
'css_id', $root_node.node_id
))}

{if and( $root_node, $items )}
{if $root_node}

    <div id="carousel_{$css_id}" class="owl-carousel owl-theme">
        {foreach $items as $item}
            <div class="item">
                {node_view_gui content_node=$item.node view=$i_view image_class=$image_class event=$item}
            </div>
        {/foreach}
    </div>

    <script>
        $(document).ready(function() {ldelim}
            $("#carousel_{$css_id}").owlCarousel({ldelim}
                responsive:{ldelim}
                  0: {ldelim}
                    items: 1
                    {rdelim},
                  480: {ldelim}
                    items: 1
                    {rdelim},
                  768: {ldelim}
                    items: {$items_per_row}
                    {rdelim},
                  900: {ldelim}
                    items: {$items_per_row}
                    {rdelim},
                  1200: {ldelim}
                    items: {$items_per_row}
                    {rdelim},
                  {rdelim},
                items : {$items_per_row},
                autoPlay: false,
                nav: {cond( $navigation|gt(0), 'true', 'false')},
                dots: {cond( $pagination|gt(0), 'true', 'false')},
                {if $auto_height}autoHeight : true,{/if}
                navText: {cond( $navigation_text|ne(false()), $navigation_text, false )}
                {if $top_pagination_position}, onInitialized: function(e){ldelim}
                    var owl = $(e.target);
                    owl.find('.owl-nav').prependTo(owl);
                    {rdelim}
                {/if}
                {rdelim});
            {rdelim});
    </script>


{/if}

{unset_defaults( array('i_view','items','autoplay','items_per_row', 'image_class','navigation','pagination','navigation_text','css_id'))}
