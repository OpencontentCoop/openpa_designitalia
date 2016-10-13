{if $openpa.content_attachment.has_content}
  <div class="u-sizeFull">
  {foreach $openpa.content_attachment.attributes as $attribute}        
    <div class="u-size3of12">
      <strong>{$attribute.contentclass_attribute_name|wash()}</strong>
    </div>
    <div class="u-size9of12">
	  {attribute_view_gui attribute=$attribute}
    </div>	
  {/foreach}
  </div>
{/if}

{if $openpa.content_attachment.children_count}
  {foreach $openpa.content_attachment.children as $item}    
    <div class="well">
      {if $item|has_attribute( 'file' )}        
        <a class="btn btn-info pull-left m_right_20" href={concat("content/download/",$item|attribute( 'file' ).contentobject_id,"/",$item|attribute( 'file' ).id,"/file/",$item|attribute( 'file' ).content.original_filename)|ezurl} title="Scarica il file {$item|attribute( 'file' ).content.original_filename|wash( xhtml )}">
            <i class="fa fa-download fa-2x"></i><span class="hide">download</span>
        </a>
      {else}
        <a class="btn btn-info pull-right" href="{$item.url_alias|ezurl(no)}">LEGGI</a>
      {/if}	  
      <p class="clearfix">
        <strong>{$item.name|wash()}</strong>		
        {if $item|has_attribute( 'file' )} 
          <br /><small>File {$item|attribute( 'file' ).content.original_filename} ({$item|attribute( 'file' ).content.filesize|si( byte )})</small>
        {/if}
      </p>
      {$item|abstract()}
	  {include uri="design:parts/toolbar/node_edit.tpl" current_node=$item}
	  {include uri="design:parts/toolbar/node_trash.tpl" current_node=$item}
    </div>      
  {/foreach}  
{/if}