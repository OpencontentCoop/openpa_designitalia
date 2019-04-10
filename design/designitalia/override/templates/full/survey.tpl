{def $openpa = object_handler($node)}
{set-block scope=root variable=cache_ttl}0{/set-block}

{if $openpa.content_tools.editor_tools}
  {include uri=$openpa.content_tools.template}
{/if}

<div class="openpa-full class-{$node.class_identifier}">
  <div class="title">
    {include uri='design:openpa/full/parts/node_languages.tpl'}
    <h2>{$node.name|wash()}</h2>
  </div>
  <div class="content-container">
    <div class="content">

      {include uri=$openpa.content_main.template}

      {include uri=$openpa.content_contacts.template}

      {if $openpa.content_detail.has_content}
        <div class="content-detail">
          {foreach $openpa.content_detail.attributes as $openpa_attribute}
            {if $openpa_attribute.identifier|begins_with( 'resource' )}
              {skip}
            {/if}
            <div class="content-detail-item{if and( $openpa_attribute.full.show_label, $openpa_attribute.full.collapse_label|not() )} withLabel{/if}">
              {if and( $openpa_attribute.full.show_label, $openpa_attribute.full.collapse_label|not() )}
                <div class="label">
                  <strong>{$openpa_attribute.label}</strong>
                </div>
              {/if}
              <div class="value">
                {if and( $openpa_attribute.full.show_label, $openpa_attribute.full.collapse_label )}
                  <strong>{$openpa_attribute.label}</strong>
                {/if}
                {attribute_view_gui attribute=$openpa_attribute.contentobject_attribute href=cond($openpa_attribute.full.show_link|not, 'no-link', '') show_newline=true()}
              </div>
            </div>
          {/foreach}
        </div>
      {/if}

    </div>
  </div>
  {if $openpa.content_date.show_date}
    {include uri=$openpa.content_date.template}
  {/if}
</div>


{include uri='design:parts/load_website_toolbar.tpl' current_user=fetch(user, current_user)}

{if openpaini('GeneralSettings','valutation', 1)}
    {ezpagedata_set( 'valuation', $node.node_id )}
{/if}
