{if $openpa.control_cache.no_cache}
    {set-block scope=root variable=cache_ttl}0{/set-block}
{/if}

{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

{if $openpa.control_menu.side_menu.root_node}
    {def $tree_menu = tree_menu( hash( 'root_node_id', $openpa.control_menu.side_menu.root_node.node_id, 'user_hash', $openpa.control_menu.side_menu.user_hash, 'scope', 'side_menu' ))
    $show_left = and( $openpa.control_menu.show_side_menu, count( $tree_menu.children )|gt(0) )}
{else}
    {def $show_left = false()}
{/if}

{def $subfield = openpaini( concat('SemanticClassGroupVars_classificazione_', $node.class_identifier), 'SubFieldIdentifier', $node.class_identifier )
     $facets = openpaini( concat('SemanticClassGroupVars_classificazione_', $node.class_identifier), 'FacetHash', hash('raw[meta_class_name_ms]','Tipologia di contenuto') )}

{def $subfield_parts = $subfield|explode('.')
     $subfield_identifier = $subfield_parts[0]
     $subfield_identifier_property = 'id'}
{if is_set($subfield_parts[1])}
    {set $subfield_identifier_property = $subfield_parts[1]}
{/if}


{ezcss_require( array('dataTables.bootstrap.css'))}
{ezscript_require(array('ezjsc::jquery','plugins/chosen.jquery.js','moment.min.js','jquery.dataTables.js','dataTables.bootstrap.js','jquery.opendataDataTable.js','jquery.opendataTools.js', 'plugins/classificazione.js'))}

<script class="init">
    var mainQuery = "{concat( 'raw[', solr_meta_subfield($subfield_identifier,$subfield_identifier_property), '] = ', $node.contentobject_id )}";
    var facets = [{foreach $facets as $identifier => $name}{ldelim}field: '{$identifier|explode('(')|implode('[')|explode(')')|implode(']')}', 'limit': 300, 'sort': 'alpha', name: '{$name}'{rdelim}{delimiter},{/delimiter}{/foreach}];
    {literal}
    $(document).ready(function () {
        initClassificazioneDatatable(mainQuery,facets)
    });

    {/literal}
</script>

<div class="openpa-full class-{$node.class_identifier}">
    <div class="title">
        {include uri='design:openpa/full/parts/node_languages.tpl'}
        <h2>{$node.name|wash()}</h2>
    </div>

    <div class="content-container">
        <div class="content{if or( $show_left, $openpa.control_menu.show_extra_menu )} withExtra{/if}">

            {include uri=$openpa.content_main.template}

            {include uri=$openpa.content_detail.template}

            <div class="panel">
                <div class="spinner text-center col-md-12">
                    <i class="fa fa-circle-o-notch fa-spin fa-3x fa-fw"></i>
                    <span class="sr-only">Loading...</span>
                </div>
                <div class="content-filters" style="display: none"></div>
                <div class="content-data"></div>
            </div>
        </div>

        {include uri='design:openpa/full/parts/section_left.tpl' extra_template=false()}
    </div>
    {if $openpa.content_date.show_date}
        {include uri=$openpa.content_date.template}
    {/if}
</div>
