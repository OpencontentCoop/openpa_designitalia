{def $collection = cond( $collection_id, fetch( content, collected_info_collection, hash( collection_id, $collection_id ) ), fetch( content, collected_info_collection, hash( contentobject_id, $node.contentobject_id ) ) )}

{set-block scope=global variable=title}{'Form %formname'|i18n( 'design/ocbootstrap/collectedinfo/form', , hash( '%formname', $node.name|wash() ) )}{/set-block}

<div class="openpa-full">
    <div class="title">
        <h2>{$object.name|wash}</h2>
    </div>
    <div class="content-container">
        <div class="content">
            <article class="content-main-abstract">
                <p>{'Thank you for your feedback.'|i18n( 'design/ocbootstrap/collectedinfo/form' )}</p>

                {if $error}

                    {if $error_existing_data}
                        <p>{'You have already submitted this form. The data you entered was:'|i18n('design/ocbootstrap/collectedinfo/form')}</p>
                    {/if}

                {/if}
            </article>


            {foreach $collection.attributes as $attribute}
                <div class="content-detail-item withLabel">
                    <div class="label"><p><strong>{$attribute.contentclass_attribute_name|wash}</strong></div>
                    <div class="value">{attribute_result_gui view=info attribute=$attribute}</div>
                </div>
            {/foreach}


            {if $collection.data_map.link.has_content}
                <a class="Button Button-default" href={concat( $collection.data_map.link.content)|ezurl()}>{'Return to site'|i18n('design/ocbootstrap/collectedinfo/form')}</a>
            {else}
                <a class="Button Button-default" href={$node.parent.url|ezurl}>{'Return to site'|i18n('design/ocbootstrap/collectedinfo/form')}</a>
            {/if}

        </div>
    </div>
</div>
