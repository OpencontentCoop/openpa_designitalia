{if $openpa.control_cache.no_cache}
    {set-block scope=root variable=cache_ttl}0{/set-block}
{/if}

{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

{def $tree_menu = tree_menu( hash( 'root_node_id', $openpa.control_menu.side_menu.root_node.node_id, 'user_hash', $openpa.control_menu.side_menu.user_hash, 'scope', 'side_menu' ))
     $show_left = true()}

<div class="openpa-full class-{$node.class_identifier}">
    <div class="title">
        {include uri='design:openpa/full/parts/node_languages.tpl'}
        <h2>{attribute_view_gui attribute=$node|attribute( 'titolo' )}</h2>
        {if $node|has_attribute( 'short_title' )}
            <h3 class="u-text-h3">
                {attribute_view_gui attribute=$node|attribute( 'short_title' )}
            </h3>
        {/if}
    </div>
    <div class="content-container">
        <div class="content{if or( $show_left, $openpa.control_menu.show_extra_menu )} withExtra{/if}">

            {include uri=$openpa.content_main.template}

            {include uri=$openpa.content_contacts.template}

            {include uri=$openpa.content_detail.template}

            {include uri=$openpa.content_infocollection.template}

            {node_view_gui content_node=$node view=children view_parameters=$view_parameters}

            {include uri='design:openpa/full/parts/event/prossimi_eventi.tpl'}

        </div>

        {include uri='design:openpa/full/parts/section_left.tpl' extra_template='design:openpa/full/parts/event/section_right.tpl' show_left=false()}
    </div>
    {if $openpa.content_date.show_date}
        {include uri=$openpa.content_date.template}
    {/if}
</div>

