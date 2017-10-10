{set_defaults(hash(
  'image_class', 'small',
  'image_css_class', "object-left",
  'fluid', false()
))}
<div class="openpa-accordion_content">
  
  {if and( is_set($node.data_map.image), $node.data_map.image.has_content)}
    <a href="{$openpa.content_link.full_link}">
        {attribute_view_gui image_class=$image_class attribute=$node.data_map.image href=false() image_css_class=$image_css_class fluid=$fluid}
    </a>  
  {/if}

  {$node|abstract()}
</div>
