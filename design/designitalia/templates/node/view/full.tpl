{def $openpa = object_handler($node)}

{if openpaini('SemanticClassGroup_classificazione','Classes',array())|contains($node.class_identifier)}
    {include uri="design:openpa/full/_classificazione.tpl"}
{else}
    {include uri=$openpa.control_template.full}
{/if}

{include uri='design:parts/load_website_toolbar.tpl' current_user=fetch(user, current_user)}

{if openpaini('GeneralSettings','valutation', 1)}
    {ezpagedata_set( 'valuation', $node.node_id )}
{/if}

{def $homepage = fetch('openpa', 'homepage')}
{if and( $homepage|has_attribute('partners'), $homepage|attribute('partners').has_content) }
    {include uri='design:footer/partners.tpl' homepage=$homepage}
{/if}