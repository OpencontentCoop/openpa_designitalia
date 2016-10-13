{if count($class_filters)|gt(0)}
<div class="u-sizeFull u-md-size11of12 u-lg-size11of12 u-margin-top-m">
    <div class="Card Card--withBorder u-color-grey-30">
        <div class="u-background-50 u-padding-all-xs">
            <h4 class="u-text-h4 u-color-white">
                {if $node|ne( false() )}
                    Cerca in {$node.name|wash()}
                {else}
                    Cerca
                {/if}
            </h4>
        </div>
        <div class="Card-content u-color-black">
  
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
</div>
{/if}
