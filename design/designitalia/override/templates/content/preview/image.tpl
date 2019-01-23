{foreach $object.data_map as $attribute}
  {if $attribute.data_type_string|eq('ezimage')}
  <div class="well well-sm">
	<p class="text-center">{attribute_view_gui attribute=$attribute image_class=large alignment=center fluid=false()}</p>
	{def $keys = array('width','height','mime_type','filename','alternative_text','url','filesize')}
	{foreach $attribute.content.original as $name => $value}
	<dl class="dl-horizontal">
		{if $keys|contains($name)}
			<dt>{$name}</dt>
			<dd>
			  {if $name|eq('url')}
				  <a target="_blank" href={$value|ezroot()}>{$value|wash()}</a>
			  {elseif $name|eq('filesize')}
				  {$value|si(byte)}
			  {else}
				  {$value|wash()}
			  {/if}
			</dd>
		{/if}
	</dl>
	{/foreach}	
  </div>
  {/if}
{/foreach}


{foreach $object.data_map as $attribute}
<dl class="dl-horizontal">	  
{if $attribute.data_type_string|ne('ezimage')}		
	  <dt>{$attribute.contentclass_attribute_name}</dt>
	  <dd>
    {if array( 'ezstring', 'ezinteger', 'ezkeyword', 'eztext', 'ezobjectrelationlist' )|contains( $attribute.data_type_string )}
    
      {def $inputTag = 'input'}
      {if array( 'eztext' )|contains( $attribute.data_type_string )}
        {set $inputTag = 'textarea'}
      {elseif array( 'ezobjectrelationlist' )|contains( $attribute.data_type_string )}          
        {if $attribute.class_content.selection_type|eq(1)}
          {set $inputTag = 'option:selected'}
        {elseif $attribute.class_content.selection_type|eq(2)}
          {set $inputTag = 'input:checked'}
        {elseif $attribute.class_content.selection_type|eq(3)}
          {set $inputTag = 'input:checked'}
        {else}
          {set $inputTag = 'nullTag'}
        {/if}
      {/if}
    
      <span>
        <button class="inline-edit" data-input="{$inputTag}" data-objectid="{$attribute.object.id}" data-attributeid="{$attribute.id}" data-version="{$attribute.version}">
        	<i class="fa fa-edit"></i>
        </button>
        {attribute_view_gui attribute=$attribute image_class=large}
      </span>
      <span class="inline-form" style="display: none">
        {attribute_edit_gui attribute=$attribute html_class='form-control'}
        <button class="btn btn-danger pull-right">Salva</button>
      </span>
      
      {undef $inputTag}
      
    {else}
      {attribute_view_gui attribute=$attribute image_class=large}
    {/if}
    
  </dd>
{/if}
</dl>
{/foreach}