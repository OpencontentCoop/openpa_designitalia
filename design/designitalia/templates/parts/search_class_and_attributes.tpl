{if count($class_filters)|gt(0)}

<div class="openpa-widget nav-section">

    <h3 class="openpa-widget-title"><span>{if $node|ne( false() )}Cerca in {$node.name|wash()}{else}Cerca{/if}</span></h3>

    <div class="openpa-widget-content">

        {def $class = fetch( 'content', 'class', hash( 'class_id', $class_filters[0] ) )}

        <form id="search-form-box" action="{'content/advancedsearch'|ezurl('no')}" method="get" class="Form Form--spaced u-text-r-xs u-layout-prose">
          {include name = searchform
             uri = 'design:parts/class_search_form.tpl'
             class = $class
             subtree = $subtree
             open_advanced = cond( is_set($open_advanced), $open_advanced, true() )
             exclude_attributes = openpaini( 'GestioneAttributi', 'attributi_da_escludere_dalla_ricerca', array() )}
        </form>
    </div>
</div>

{/if}
