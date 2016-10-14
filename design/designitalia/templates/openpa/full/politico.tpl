{if $openpa.control_cache.no_cache}
    {set-block scope=root variable=cache_ttl}0{/set-block}
{/if}

{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

{def $tree_menu = tree_menu( hash( 'root_node_id', $openpa.control_menu.side_menu.root_node.node_id, 'user_hash', $openpa.control_menu.side_menu.user_hash, 'scope', 'side_menu' ))
     $show_left = and( $openpa.control_menu.show_side_menu, count( $tree_menu.children )|gt(0) )}


<div class="content-view-full class-{$node.class_identifier}">
    <div class="u-padding-bottom-l content-title">
        {include uri='design:openpa/full/parts/node_languages.tpl'}
        <h2 class="u-text-h2">{$node.name|wash()}</h2>
    </div>
    <div class="Grid Grid--withGutter">
        <div class="Grid-cell u-padding-bottom-xl{if and( $openpa.control_menu.show_extra_menu|not(), $show_left|not() )} u-sizeFull{elseif or( $show_left, $openpa.control_menu.show_extra_menu )}  u-md-size7of12 u-lg-size7of12{/if}">

            {include uri=$openpa.content_main.template}

            {if $openpa.content_detail.has_content}
            <div class="content-detail">
            {foreach $openpa.content_detail.attributes as $openpa_attribute}
                <div class="row">
                    {if $openpa_attribute.full.show_label}
                        <div class="col-md-3">
                            <strong>{$openpa_attribute.label}</strong>
                        </div>
                    {/if}
                    <div class="col-md-{if $openpa_attribute.full.show_label}9{else}12{/if}">
                        {attribute_view_gui attribute=$openpa_attribute.contentobject_attribute href=cond($openpa_attribute.full.show_link|not, 'no-link', '')}
                    </div>
                </div>
            {/foreach}
            </div>
            {/if}

            {*OGGETTI INVERSAMENTE CORRELATI - COME MEMBRO DI UN ORGANO POLITICO *}
            {include name=reverse_related_objects_specific_class_and_attribute
                    node=$node
                    classe='organo_politico'
                    attrib='membri'
                    title="Membro di:"
                    uri='design:parts/reverse_related_objects_specific_class_and_attribute.tpl'}


            {include uri=$openpa.content_attachment.template}

            {include uri=$openpa.content_infocollection.template}

            {include uri=$openpa.control_children.template}
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
    </div>
    {if $openpa.content_date.show_date}
        <div class="u-sizeFull u-margin-top-l">
            <p class="u-floatRight">{include uri=$openpa.content_date.template}</p>
        </div>
    {/if}
</div>
