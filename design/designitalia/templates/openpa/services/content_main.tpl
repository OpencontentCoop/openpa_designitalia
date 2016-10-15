{if $openpa.content_main.has_content}
    <article class="content-main-abstract">
        {if is_set( $openpa.content_main.parts.abstract )}
            {attribute_view_gui attribute=$openpa.content_main.parts.abstract.contentobject_attribute}
        {/if}

        {if is_set( $openpa.content_main.parts.image )}
            {include uri='design:atoms/image.tpl' item=$node image_class=imagefull css_classes="main_image"}
        {/if}

    </article>
    {if is_set( $openpa.content_main.parts.full_text )}
        <article class="content-main-body">
            {attribute_view_gui attribute=$openpa.content_main.parts.full_text.contentobject_attribute}
        </article>
    {/if}
{/if}
