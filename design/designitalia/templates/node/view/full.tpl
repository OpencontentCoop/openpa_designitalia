{def $openpa = object_handler($node)}

{if openpaini('SemanticClassGroup_classificazione','Classes',array())|contains($node.class_identifier)}
    {include uri="design:openpa/full/_classificazione.tpl"}
{else}
    {include uri=$openpa.control_template.full}
{/if}
