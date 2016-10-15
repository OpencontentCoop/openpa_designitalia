{if $openpa.control_cache.no_cache}
    {set-block scope=root variable=cache_ttl}0{/set-block}
{/if}

{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

{def $tree_menu = tree_menu( hash( 'root_node_id', $openpa.control_menu.side_menu.root_node.node_id, 'user_hash', $openpa.control_menu.side_menu.user_hash, 'scope', 'side_menu' ))
     $show_left = and( $openpa.control_menu.show_side_menu, count( $tree_menu.children )|gt(0) )}

<div class="openpa-full class-{$node.class_identifier}">
    <div class="openpa-title">
        {include uri='design:openpa/full/parts/node_languages.tpl'}
        <h2>{$node.name|wash()}</h2>
    </div>
    <div class="openpa-content-container">
        <div class="openpa-content{if or( $show_left, $openpa.control_menu.show_extra_menu )}-wide{/if}">

            {include uri=$openpa.content_main.template}

            <h3>Edizioni</h3>
            {def $parameters = hash(
              'subtree', array( $node.node_id ),
              'classes', array( 'edizione' ),
              'class_names', array( "Edizione corso di formazione" ),
              'fields', array( solr_meta_field('name'), solr_field('from_time','date'), solr_field('quota','text'), solr_field('stato_iscrizioni','text'), solr_meta_field('main_url_alias') ),
              'keys', array( "Edizione", "Data", "Quota", "Stato iscrizioni" ),
              'filters', array( concat( '-meta_id_si:', $node.contentobject_id ) ),
              'table_id', concat( 'childOf-', $node.node_id ),
            )}

          {include uri='design:datatable/view.tpl'
                   subtree=$parameters.subtree
                   classes=$parameters.classes
                   class_names=$parameters.class_names
                   fields=$parameters.fields
                   keys=$parameters.keys
                   filters=$parameters.filters
                   table_id=$parameters.table_id}

        </div>

        {include uri='design:openpa/full/parts/section_left.tpl'}
    </div>
    {if $openpa.content_date.show_date}
        {include uri=$openpa.content_date.template}
    {/if}
</div>
