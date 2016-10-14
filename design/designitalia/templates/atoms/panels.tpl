{set_defaults(hash(
    'items_per_row', 4,
    'i_view', 'panel',
    'image_class', 'squarethumb'
))}

{foreach $items as $i => $child }
    {if $i|eq(0)}
        <div class="Grid Grid--withGutter">
    {/if}

    <div class="u-size12of12 u-sm-size12of12 u-md-size{div(12,$items_per_row)}of12 u-lg-size{div(12,$items_per_row)}of12">
        {node_view_gui content_node=$child view=$i_view image_class=$image_class}
    </div>

    {if eq(sum($i,1)|mod($items_per_row),0)}
        </div>
        <div class="Grid Grid--withGutter">
    {/if}
    {if $i|eq(count($items)|sub(1))}
        </div>
    {/if}
{/foreach}

{unset_defaults( array('items_per_row', 'i_view', 'image_class') )}
