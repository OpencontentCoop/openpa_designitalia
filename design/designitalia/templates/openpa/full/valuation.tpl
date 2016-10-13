{if $openpa.control_cache.no_cache}
    {set-block scope=root variable=cache_ttl}0{/set-block}
{/if}

{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

{def $show_left = false()}


<div class="u-layout-wide u-layoutCenter u-layout-withGutter u-padding-r-top content-view-full class-{$node.class_identifier}">
    <div class="u-padding-bottom-l content-title">
        {include uri='design:openpa/full/parts/node_languages.tpl'}
        <h2 class="u-text-h2">{$node.name|wash()}</h2>
    </div>
    <div class="Grid Grid--withGutter">
        <div class="Grid-cell u-padding-bottom-xl{if and( $openpa.control_menu.show_extra_menu|not(), $show_left|not() )} u-sizeFull{elseif or( $show_left, $openpa.control_menu.show_extra_menu )}  u-md-size7of12 u-lg-size7of12{/if}">

            {include uri=$openpa.content_infocollection.template}
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
</div>