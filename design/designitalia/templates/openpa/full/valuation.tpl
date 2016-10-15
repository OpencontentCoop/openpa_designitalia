{if $openpa.control_cache.no_cache}
    {set-block scope=root variable=cache_ttl}0{/set-block}
{/if}

{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

{def $show_left = false()}

<div class="openpa-full class-{$node.class_identifier}">
    <div class="openpa-title">
        {include uri='design:openpa/full/parts/node_languages.tpl'}
        <h2>{$node.name|wash()}</h2>
    </div>
    <div class="openpa-content-container">
        <div class="openpa-content{if or( $show_left, $openpa.control_menu.show_extra_menu )}-wide{/if}">

            {include uri=$openpa.content_infocollection.template}

        </div>

        {include uri='design:openpa/full/parts/section_left.tpl'}
    </div>
    {if $openpa.content_date.show_date}
        {include uri=$openpa.content_date.template}
    {/if}
</div>
