{set_defaults(hash('image_class', 'small'))}
<div class="openpa-line class-{$node.class_identifier} media {$node|access_style}">

    {if $node|has_attribute( 'image' )}
        <div class="media-image">
            <a href="{if is_set( $node.url_alias )}{$node.url_alias|ezurl('no')}{else}#{/if}">
                {attribute_view_gui attribute=$node|attribute( 'image' ) href=false() image_class=$image_class image_css_class="media-object" fluid=false()}
            </a>
        </div>
    {/if}
    <div class="media-body">
        <h3 class="media-heading">
            <a href="{$openpa.content_link.full_link}">{$node.name|wash()}</a>
        </h3>

        {if $openpa.content_line.has_content}
          <ul class="media-details">
            {foreach $openpa.content_line.attributes as $openpa_attribute}              
              <li>
                {if $openpa_attribute.line.show_label}
                 <strong>{$openpa_attribute.label}:</strong>
                {/if}              
                {attribute_view_gui attribute=$openpa_attribute.contentobject_attribute href=cond($openpa_attribute.line.show_link|not, 'no-link', '')}
              </li>
            {/foreach}
          </ul>

        {/if}

    </div>
</div>
{*
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

*}
