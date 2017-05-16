{def $limit = 10}
<div class="openpa-full">
  <div class="title">
    <h1><i class="fa fa-tag"></i> {$tag.keyword|wash}</h1>
  </div>
  <div class="content-container">
    <div class="content">

      {def $nodes = fetch( content, tree, hash( parent_node_id, ezini( 'NodeSettings', 'RootNode', 'content.ini' ),
                                                extended_attribute_filter,
                                                hash( id, TagsAttributeFilter,
                                                      params, hash( tag_id, $tag.id, include_synonyms, true() ) ),
                                                offset, first_set( $view_parameters.offset, 0 ), limit, $limit,
                                                main_node_only, true(),
                                                sort_by, array( modified, false() ) ) )}

      {def $nodes_count = fetch( content, tree_count, hash( parent_node_id, ezini( 'NodeSettings', 'RootNode', 'content.ini' ),
                                                            extended_attribute_filter,
                                                            hash( id, TagsAttributeFilter,
                                                                  params, hash( tag_id, $tag.id, include_synonyms, true() ) ),
                                                            main_node_only, true() ) )}

      {if $nodes|count}
        <div class="openpa-widget-content u-layout-centerContent u-cf">
          <section class="js-Masonry-container u-layout-wide" data-columns>
            {foreach $nodes as $node}
              <div class="Masonry-item js-Masonry-item">
                {node_view_gui content_node=$node view='panel' image_class='agid_panel'}
              </div>
            {/foreach}
          </section>
        </div>
      {/if}

      {include uri='design:navigator/google.tpl'
               page_uri=concat( '/tags/view/', $tag.url )
               item_count=$nodes_count
               view_parameters=$view_parameters
               item_limit=$limit}
    </div>
  </div>
</div>

{undef $limit $nodes $nodes_count}
