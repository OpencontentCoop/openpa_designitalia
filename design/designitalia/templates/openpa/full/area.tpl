{if $openpa.control_cache.no_cache}
    {set-block scope=root variable=cache_ttl}0{/set-block}
{/if}

{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

{def $tree_menu = tree_menu( hash( 'root_node_id', $openpa.control_menu.side_menu.root_node.node_id, 'user_hash', $openpa.control_menu.side_menu.user_hash, 'scope', 'side_menu' ))
     $show_left = and( $openpa.control_menu.show_side_menu, count( $tree_menu.children )|gt(0) )}


<div class="u-layout-wide u-layoutCenter u-layout-withGutter u-padding-r-top content-view-full class-{$node.class_identifier}">
    <div class="u-padding-bottom-l content-title">
        {include uri='design:openpa/full/parts/node_languages.tpl'}
        <h2 class="u-text-h2">{$node.name|wash()}</h2>
    </div>

    <div class="Grid Grid--withGutter">
        <div class="Grid-cell u-padding-bottom-xl{if and( $openpa.control_menu.show_extra_menu|not(), $show_left|not() )} u-sizeFull{elseif or( $show_left, $openpa.control_menu.show_extra_menu )}  u-md-size7of12 u-lg-size7of12{/if}">

            {include uri=$openpa.content_main.template}

            {include struttura=$node uri='design:openpa/full/parts/struttura_responsabile.tpl'}

            {include uri=$openpa.content_contacts.template}

            {include name=ruoli struttura=$node uri='design:parts/ruoli_per_struttura.tpl'}

            {include struttura=$node uri='design:openpa/full/parts/struttura_personale.tpl'}

            {include uri=$openpa.content_detail.template}

            {include uri=$openpa.content_infocollection.template}

            {include uri='design:parts/posizione_in_organigramma.tpl'}

            {include uri=$openpa.control_children.template}
        </div>

    </div>

    {if or($openpa.control_menu.show_extra_menu, $show_left)}
        <div class="Grid-cell u-sizeFull u-md-size4of12 u-lg-size4of12 u-md-before1of12 u-lg-before1of12 u-padding-bottom-xl">
            {if $show_left}
                {include uri='design:openpa/full/parts/section_left.tpl'}
            {/if}

            {if $openpa.control_menu.show_extra_menu}
                {include uri='design:openpa/full/parts/section_right.tpl'}
            {/if}

            <a href="#" title="torna all'inizio del contenuto" class="u-hiddenVisually">torna all'inizio del contenuto</a>
        </div>
    {/if}

    {if $openpa.content_date.show_date}
        <div class="u-sizeFull u-margin-top-l">
            <p class="u-floatRight">{include uri=$openpa.content_date.template}</p>
        </div>
    {/if}

</div>

