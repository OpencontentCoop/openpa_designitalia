{if $openpa.content_infocollection.is_information_collector}
<form action="{"/content/action"|ezurl(no)}" method="post">
<div class="content-detail">
    {include name=Validation uri='design:content/collectedinfo_validation.tpl'
             class='message-warning'
             validation=$validation
             collection_attributes=$collection_attributes}

    {foreach $openpa.content_infocollection.attributes as $attribute_handler}
        <div class="content-detail-item withLabel">
            <div class="label">
                <p class="text-right"><strong>{$attribute_handler.contentclass_attribute.name|wash()}</strong></p>
            </div>
            <div class="value">
                {attribute_view_gui attribute=$attribute_handler.contentobject_attribute}
            </div>
        </div>
    {/foreach}

    <div class="content-action clearfix">
        <input type="submit" class="btn btn-primary btn-lg pull-right" name="ActionCollectInformation" value="Invia" />
        <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
        <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
        <input type="hidden" name="ViewMode" value="full" />
    </div>
</div>
</form>
{/if}
