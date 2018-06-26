<div class="openpa-accordion_content">
	<div style="display: flex !important;align-items: center;height: 100%;">
	  {if and( is_set($node.data_map.sindaco ), $node.data_map.sindaco.content.data_map.image.has_content )}
	    <a href="{$node.data_map.sindaco.content.main_node.url_alias|ezurl('no')}">
	        {attribute_view_gui image_class=medium attribute=$node.data_map.sindaco.content.data_map.image href=false() image_css_class="object-right" fluid=false() alt_text=concat("Immagine decorativa per il contenuto ", $node.name|wash())}
	    </a>
	  {/if}
	  <div>{$node|abstract()}</div>
	</div>
</div>
