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
{if or($homepage.node_id|eq($node.node_id), ezini('SiteSettings', 'IndexPage')|eq(concat('content/view/full/', $node.node_id)))}
    {ezpagedata_set('is_homepage', true())}
{/if}

{if $openpa.control_area_tematica.is_area_tematica}
    {ezpagedata_set('is_area_tematica', $openpa.control_area_tematica.area_tematica.contentobject_id)}
{/if}

{if and( $homepage|has_attribute('partners'), $homepage|attribute('partners').has_content) }
    {include uri='design:footer/partners.tpl' homepage=$homepage}
{/if}
