{set_defaults(hash(
  'image_class', 'small',
  'image_css_class', "object-left",
  'fluid', false()
))}
<div class="openpa-accordion_content">

    {if $node|has_attribute('image')}
    <a href="{$openpa.content_link.full_link}">
        {attribute_view_gui image_class=$image_class attribute=$node|attribute('image') href=false() image_css_class=$image_css_class fluid=$fluid}
    </a>  
  {/if}

  {$node|abstract()}
</div>
