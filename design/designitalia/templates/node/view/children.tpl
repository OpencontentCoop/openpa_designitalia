{def $openpa = object_handler($node)}

{def $current_views = $openpa.control_children.current_views
     $views = $openpa.control_children.views}

{if $current_views|count()|gt(1)}
<div class="u-flex u-flexWrap u-flexJustifyCenter u-margin-bottom-l">
{foreach $current_views as $identifier}
<div class="FlexItem">
    <div class="u-padding-all-xxs">
    {if $openpa.control_children.current_view|eq($identifier)}
        <span class="Button Button--info u-text-r-xs is-pressed">
            <i class="{$views[$identifier].icon_class}"></i>
            {$views[$identifier].label|wash()}
        </span>
    {else}
        <a class="Button Button--info u-text-r-xs" href="{concat($node.url_alias, '/(view)/', $identifier)|ezurl(no)}">
            <i class="{$views[$identifier].icon_class}"></i>
            {$views[$identifier].label|wash()}
        </a>
    {/if}
    </div>
</div>
{/foreach}
</div>
{/if}

{include uri=$openpa.control_children.template}
