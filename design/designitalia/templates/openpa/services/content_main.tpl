{if $openpa.content_main.has_content}
    <article class="Prose">
      {if is_set( $openpa.content_main.parts.abstract )}
          {attribute_view_gui attribute=$openpa.content_main.parts.abstract.contentobject_attribute}
      {/if}
    </article>
    {if is_set( $openpa.content_main.parts.image )}
      <div class="u-layoutCenter">
        {include uri='design:atoms/image.tpl' item=$node image_class=imagefull css_classes="main_image" image_css_class="u-sizeFull"}
      </div>
    {/if}    
    {if is_set( $openpa.content_main.parts.full_text )}
        <article class="Prose">
            {attribute_view_gui attribute=$openpa.content_main.parts.full_text.contentobject_attribute}
        </article>
    {/if}
{/if}