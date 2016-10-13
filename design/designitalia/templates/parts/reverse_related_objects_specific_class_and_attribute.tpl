{*
	OGGETTI INVERSAMENTE CORRELATI
	node	nodo a cui si riferisce
	title	titolo del blocco
	classe	classe su cui filtrare la ricerca
	attrib	attribute su cui filtrare la ricerca
	href	se =nolink non fa vedere il link all'oggetto inversamente correlato


*}

{if $classe|eq("struttura")}
	{def $sortby = array( 'class_identifier', true() )}
{else}
	{def $sortby = array( 'name', true() )}
{/if}


{debug-log var=concat($classe,"/",$attrib) msg='classe/attributo' }

{*def $stringa_ricerca = concat($classe,"/",$attrib)
     $objects = fetch( 'content', 'reverse_related_objects', hash( 'object_id',$node.object.id, 'attribute_identifier', $stringa_ricerca, 'sort_by',  $sortby ) )
     $objects_count = $objects|count()
     $my_node = ""*}
{def $search_reverse_related = fetch('ezfind','search', hash('limit',100,'filter',array(concat($classe,"/",$attrib,"/id:",$node.object.id))))
	 $objects = $search_reverse_related.SearchResult
	 $objects_count = $search_reverse_related.SearchCount
	 $my_node = ""}

{def $style='col-odd'}
{if $objects_count|gt(0)}

	{if $objects_count|lt(100)}

		<div class="u-sizeFull u-md-size11of12 u-lg-size11of12 u-margin-top-m oggetti-correlati oggetti-inv-correlati{if $objects|count()|not()} nocontent{/if}">
			<div class="Card Card--withBorder u-color-grey-30">
				<div class="u-background-50 u-padding-all-xs">
					<h4 class="u-text-h4 u-color-white">
						{$title}
					</h4>
				</div>
				<div class="Card-content u-color-black">

					{foreach $objects as $object}
					  {if $object.can_read}
						{if $style|eq('col-even')}{set $style='col-odd'}{else}{set $style='col-even'}{/if}
							<div class="{$style} col float-break col-notitle">
							<div class="col-content"><div class="col-content-design">
								{if $classe|eq('ruolo')}
									{$object.name}

									{if $object.data_map.descrizione_ruolo_speciale.has_content}
										{attribute_view_gui attribute=$object.data_map.descrizione_ruolo_speciale}
									{else}
										{if $object.name|contains('Direttore Generale')}
										{elseif $object.name|contains('Segretario')}
										{elseif $object.name|contains('Dirigente con Incarico Speciale')}
											 {attribute_view_gui  href=nolink attribute=$object.data_map.struttura_di_riferimento}
										{elseif $object.name|contains('Capoufficio')}
											 {attribute_view_gui  href=nolink attribute=$object.data_map.struttura_di_riferimento}
										{elseif $object.name|contains('Responsabile del polo sociale')}
											 {attribute_view_gui href=nolink attribute=$object.data_map.struttura_di_riferimento}
										{elseif $object.name|contains('Segretario di circoscrizione')}
											 {attribute_view_gui  href=nolink attribute=$object.data_map.struttura_di_riferimento}
										{elseif $object.name|contains('Funzionario di sezione')}
											 {attribute_view_gui href=nolink attribute=$object.data_map.struttura_di_riferimento}
										{elseif $object.name|contains("Dirigente dell'area")}
											"{attribute_view_gui  href=nolink attribute=$object.data_map.struttura_di_riferimento}"
										{elseif $object.name|contains('Dirigente del servizio')}
											"{attribute_view_gui href=nolink attribute=$object.data_map.struttura_di_riferimento}"
										{elseif $object.data_map.struttura_di_riferimento.has_content}
											 {attribute_view_gui  href=nolink attribute=$object.data_map.struttura_di_riferimento}
										{/if}
										{/if}
								{elseif $classe|eq('struttura')}
									{set $my_node=fetch( 'content', 'node', hash( 'node_id', $object.data_map.tipo_struttura.content.relation_list[0].node_id) )}
									   <a href={$object.url_alias|ezurl()}>{$my_node.name|wash()} "{$object.name}"</a>
								{else}
									{if is_set($href)}
										{if $href|eq("nolink")}
											{$object.name}
										{/if}
									{else}
										{node_view_gui content_node=$object view='line'}
									{/if}
								{/if}

							</div></div>
							</div>
					  {/if}
					{/foreach}
				</div>
			</div>
		</div>

	{/if}

{/if}


