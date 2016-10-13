<div class="content-view-line class-{$node.class_identifier} media Grid Grid--withGutter u-margin-bottom-l">

  {if $node|has_attribute( 'image' )}
    <div class="Grid-cell u-size3of12">
      <a class="u-floatLeft" href="{if is_set( $node.url_alias )}{$node.url_alias|ezurl('no')}{else}#{/if}">
        {attribute_view_gui attribute=$node|attribute( 'image' ) href=false() image_class='squarethumb' css_class="media-object"}
      </a>
    </div>
  {/if}
  <div class="Grid-cell {if $node|has_attribute( 'image' )}u-size9of12{/if}">
    <h3 class="u-text-h3">
	  {if is_set( $node.url_alias )}
		<a class="u-textClean u-color-black" href="{$node.url_alias|ezurl('no')}" title="{$node.name|wash()}">{$node.name|wash()}</a>
	  {else}
		{$node.name|wash()}
	  {/if}
	</h3>	
    {if $node|has_abstract()}
	    <div class="u-lineHeight-l u-text-r-xs u-textSecondary">
	      {$node|abstract()}
	    </div>
	{/if}
	{if $node|has_attribute( 'tematica' )}
        {attribute_view_gui attribute=$node|attribute( 'tematica' )}
    {/if}
  </div>
</div>