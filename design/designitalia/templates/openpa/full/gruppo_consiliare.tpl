{if $openpa.control_cache.no_cache}
    {set-block scope=root variable=cache_ttl}0{/set-block}
{/if}

{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

{def $tree_menu = tree_menu( hash( 'root_node_id', $openpa.control_menu.side_menu.root_node.node_id, 'user_hash', $openpa.control_menu.side_menu.user_hash, 'scope', 'side_menu' ))
     $show_left = and( $openpa.control_menu.show_side_menu, count( $tree_menu.children )|gt(0) )}

<div class="openpa-full class-{$node.class_identifier}">
    <div class="title">
        {include uri='design:openpa/full/parts/node_languages.tpl'}
        <h2>{$node.name|wash()}</h2>
    </div>
    <div class="content-container">
        <div class="content{if or( $show_left, $openpa.control_menu.show_extra_menu )} withExtra{/if}">

            {include uri=$openpa.content_main.template}

            {include uri=$openpa.content_detail.template}

            {def $search_hash = hash(  'limit', 100,
                                       'class_id', array( 'politico' ),
                                       'filter', array( concat( solr_meta_subfield('gruppo_politico','id'),':', $node.object.id ) ),
                                       'sort_by', hash('name', 'asc') )
                 $search = fetch( ezfind, search, $search_hash )}

            {if $search.SearchCount}
                <div class="openpa-children">
                    <h3 class="openpa-widget-title"><span>Componenti</span></h3>
                  {set_defaults(hash('image_class', 'small'))}
                  {foreach $search.SearchResult as $child }
                      {node_view_gui view='line' content_node=$child}
                  {/foreach}
                </div>
            {/if}

            {include uri=$openpa.content_infocollection.template}

            {node_view_gui content_node=$node view=children view_parameters=$view_parameters}

        </div>

        {include uri='design:openpa/full/parts/section_left.tpl'}
    </div>
    {if $openpa.content_date.show_date}
        {include uri=$openpa.content_date.template}
    {/if}
</div>
