{set_defaults(hash(
  'image_class', 'small',
  'image_css_class', "object-left",
  'fluid', false()
))}
<div class="openpa-accordion_content">
	<div style="display: flex !important;align-items: center;height: 100%;">
	  {if $node|has_attribute('image')}
	    <a href="{$openpa.content_link.full_link}">
	        {attribute_view_gui image_class=$image_class attribute=$node|attribute('image') href=false() image_css_class=$image_css_class fluid=$fluid alt_text=concat("Immagine decorativa per il contenuto ", $node.name|wash())}
	    </a>  
	  {/if}
	  <div>
	  	{$node|abstract()}
	  </div>
	</div>
</div>
