{set_defaults( hash(  
  'view', 'line',
  'delimiter', '',
  'exclude_classes', openpaini( 'ExcludedClassesAsChild', 'FromFolder', array( 'image', 'infobox', 'global_layout' ) ),
  'include_classes', array(),
  'type', 'exclude'
))}

{if $type|eq( 'exclude' )}
  {def $params = hash( 'class_filter_type', 'exclude', 'class_filter_array', $exclude_classes )}
{else}
  {def $params = hash( 'class_filter_type', 'include', 'class_filter_array', $include_classes )}
{/if}

{def $children_count = fetch( openpa, 'list_count', hash( 'parent_node_id', $node.node_id )|merge( $params ) )
     $children = fetch( openpa, 'list', hash( 'parent_node_id', $node.node_id,'sort_by', $node.sort_array )|merge( $params ) ) }

<div class="content-view-children fuelux panel">    
  <ul class="u-layout-prose u-text-r-xs tree tree-folder-select" role="tree">
      {foreach $children as $child }
        {def $child_children_count = $child.children_count}
        <li class="u-padding-all-s tree-branch" data-template="treebranch" role="treeitem" aria-expanded="true" data-nodeid="{$child.node_id}">
          <i class="spinnerable fa fa-{if $children_count|eq(0)}file{else}folder{/if}"></i> 
          {node_view_gui view=text_linked content_node=$child}
          <a class="direct-link" target="_blank" href="{$child.url_alias|ezurl(no)}"><small><i class="fa fa-link"></i></small></a>
        </li>  
        {undef $child_children_count}
      {/foreach} 
  </ul>    
</div>

{literal}
<script>
  $(document).ready(function(){
    $(document).on('click','.tree-branch a',function(e){                  
      if (!$(this).hasClass('direct-link')) {	
		var container = $(this).parent();      
		var icon = container.find('i.spinnerable');      
		if (icon.hasClass('fa-folder')) {
		  var children = container.find('ul.tree-branch-children');        
		  icon.toggleClass('fa-folder-open');
		  children.toggle();        
		  if (children.length == 0){            
			var tree = $('<ul role="group" class="tree-branch-children"></ul>');
			icon.addClass('fa-spinner').addClass('fa-spin');
			$.get('/openpa/data/tree?parent='+container.data('nodeid'), function(response){
			  $.each(response, function(){
				var item = $('<li class="u-padding-all-s  tree-branch" data-template="treebranch" role="treeitem" aria-expanded="true" data-nodeid="'+this.main_node_id+'" />');
				if (parseInt( this.children_count ) > 0) {
				  item.append('<i class="spinnerable fa fa-folder" />');
				}else{
				  item.append('<i class="spinnerable fa fa-file" />');
				}
				
				if (this.data_map.file && this.data_map.file.content != '') {
				  var filenameParts = this.data_map.file.content.split('|');
				  var filename = filenameParts[1];
				  item.append('<a title="Scarica il file" href="/content/download/'+this.contentobject_id+'/'+this.data_map.file.id+'/file/'+filename+'"><span title="'+filename+'"> '+this.name+' <i class="fa fa-download"></i></span></a>');
				}else{
				  item.append('<a href="/'+this.url_alias+'"> '+this.name+'</a>');
				}
				item.append('<a class="direct-link" target="_blank" href="/'+this.url_alias+'"><small> <i class="fa fa-link"></i></small></a>');
				tree.append(item);				
			  });
			  icon.removeClass('fa-spinner').removeClass('fa-spin');
			  container.append(tree);
			});
		  }
		  e.preventDefault();
		}
      }
    });
  });
</script>
{/literal}
