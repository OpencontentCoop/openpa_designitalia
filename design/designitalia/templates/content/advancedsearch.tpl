{def $Classes             = cond( ezhttp( 'ClassArray','get','hasVariable' ), ezhttp( 'ClassArray', 'get' ), array() )
     $Subtree             = cond( ezhttp( 'SubTreeArray','get','hasVariable' ), ezhttp( 'SubTreeArray', 'get' ), array( ezini( 'NodeSettings', 'RootNode', 'content.ini' ) ) )
     $isSingleClassSearch = cond( $Classes|count()|eq(1), $Classes[0], false() )
     $isSubtreeSearch     = cond( and( $Subtree, $Subtree[0]|ne( ezini( 'NodeSettings', 'RootNode', 'content.ini' ) ) ), true(), false() )
     $Class               = cond( $isSingleClassSearch, fetch( 'content', 'class', hash( 'class_id', $isSingleClassSearch ) ), false() )
     $RootNode            = cond( $Subtree, fetch( content, node, hash( node_id, $Subtree[0] ) ), false())
     $Sort                = cond( ezhttp( 'Sort','get','hasVariable' ), ezhttp( 'Sort', 'get' ), false() )
     $Order               = cond( ezhttp( 'Order','get','hasVariable' ), ezhttp( 'Order', 'get' ) )
     $Anno                = cond( ezhttp( 'Anno','get','hasVariable' ), ezhttp( 'Anno', 'get' ) )
     $Logic               = cond( ezhttp( 'Logic','get','hasVariable' ), ezhttp( 'Logic', 'get' ) )}

{def $anni = openpaini( 'MotoreDiRicerca', 'RicercaAvanzataSelezionaAnni', array() )
     $link_istruzioni_ricerca = fetch('content','node',hash('node_id', openpaini('LinkSpeciali', 'NodoIstruzioniRicerca', 0) ))
     $limit = 20
     $search = search_query( hash( 'SearchOffset', $view_parameters.offset,
                                   'SearchLimit', $limit,
                                   'Facet', array( hash( 'field', 'class', 'name', 'Tipologia di contenuto', 'limit', 1000 ) ) ) )
     $not_available_facets = search_exclude_class_facets()}

{def $count         = $search['SearchCount']
     $results       = $search['SearchResult']
     $stop_words    = $search['StopWordArray']
     $search_extras = $search['SearchExtras']
     $uri_suffix    = $search['UriSuffix']}

<p class="u-md-hidden u-lg-hidden u-padding-r-all u-text-m u-background-grey-20">
    <span class="Icon-list u-text-r-xl u-alignMiddle u-padding-r-right" aria-hidden="true"></span>
    <a accesskey="3"  class="js-scrollTo u-text-r-s u-textClean u-color-grey-50 u-alignMiddle" href="#subnav" >Vai ai filtri di ricerca</a>
</p>

<div class="openpa-full">

    <div class="title">
        <h2>
            Cerca
            {if $isSubtreeSearch}
                in "<a href="{$RootNode.url_alias|ezurl(no)}" title='Vai alla pagina "{$RootNode.name|wash}"'>{$RootNode.name|wash}</a>"
            {else}
                in tutto il sito
            {/if}
            {if $isSingleClassSearch}
                <small>solo tra informazioni di tipo "{$Class.name}"</small>
            {/if}
        </h2>
    </div>

    <form class="Form Form--spaced" action="{"/content/advancedsearch/"|ezurl(no)}" id="ezfindsearch" method="get">

        <div class="content-container">
            <div class="content withExtra">

                    {if $isSingleClassSearch|not()}
                    <fieldset class="u-hidden u-sm-block u-md-block u-lg-block">
                        {* RICERCA LIBERA *}
                        <div class="Form-field Form-field--withPlaceholder">
                            <input class="Form-input u-text-r-s u-padding-r-all u-color-black" id="SearchText" name="SearchText" value="{$search_text|wash}" style="margin: 0 !important;">
                            <label class="Form-label u-color-grey-90 u-text-r-m" for="SearchText">Ricerca libera</label>
                            <button class="u-background-40 u-color-white u-padding-all-s u-text-r-m u-textNoWrap" name="SearchButton">{'Search'|i18n('design/ezwebin/content/search')}</button>
                        </div>

                        {* RICERCA AVANZATA *}
                        <div class="Grid">
                            <div class="Form-field Grid-cell u-sizeFull u-sm-size1of4 u-md-size1of4 u-lg-size1of4">
                                <label class="Form-label u-hiddenVisually" for="Sort">Ordina per</label>
                                <select class="Form-input u-color-grey-90" id="Sort" name="Sort">
                                    <option value="">Ordina per</option>
                                    <option {if $Sort|eq('score')} selected="selected"{/if} value="score">Rilevanza</option>
                                    <option {if $Sort|eq('published')} selected="selected"{/if} value="published">Data di pubblicazione</option>
                                    <option {if $Sort|eq('class_name')} selected="selected"{/if} value="class_name">Tipologia di contenuto</option>
                                    <option {if $Sort|eq('name')} selected="selected"{/if} value="name">Nome</option>
                                </select>
                            </div>
                            <div class="Form-field Grid-cell u-sizeFull u-sm-size1of4 u-md-size1of4 u-lg-size1of4">
                                <label class="Form-label u-hiddenVisually" for="Order">Ordinamento</label>
                                <select class="Form-input u-color-grey-90" id="Order" name="Order">
                                    <option value="">Ordinamento</option>
                                    <option {if $Order|eq('desc')} selected="selected"{/if} value="desc">Discendente</option>
                                    <option {if $Order|eq('asc')} selected="selected"{/if} value="asc">Ascendente</option>
                                </select>
                            </div>
                            <div class="Form-field Grid-cell u-sizeFull u-sm-size1of4 u-md-size1of4 u-lg-size1of4">
                                <label class="Form-label u-hiddenVisually" for="Anno">Anno</label>
                                <select class="Form-input u-color-grey-90" id="Anno" name="Anno">
                                    <option value="">Qualsiasi anno</option>
                                    {foreach $anni as $anno}
                                        <option {if and( is_set($Anno), $anno|eq($Anno))} selected="selected"{/if} value="{$anno}">{$anno}</option>
                                    {/foreach}
                                </select>
                            </div>
                            <div class="Form-field Grid-cell u-sizeFull u-sm-size1of4 u-md-size1of4 u-lg-size1of4">
                                <label class="Form-label u-hiddenVisually" for="Logic">Condizioni logiche</label>
                                <select class="Form-input u-color-grey-90" id="Logic" name="Logic">
                                    <option value="">Condizioni logiche</option>
                                    <option {if $Logic|eq('AND')} selected="selected"{/if} value="AND">AND</option>
                                    <option {if $Logic|eq('OR')} selected="selected"{/if} value="OR">OR</option>
                                </select>
                            </div>
                        </div>
                    </fieldset>
                    {/if}


                {* FORSE CERCAVI... *}
                {if $search_extras.spellcheck_collation}
                    {def $spell_url=concat('content/advancedsearch/',$search_text|count_chars()|gt(0)|choose('',concat('?SearchText=',$search_extras.spellcheck_collation|urlencode)))|ezurl}
                    <p class="Prose u-margin-bottom-l">
                        <small>
                            Forse intendevi cercare per <a
                                    href='{$spell_url}'><strong>{$search_extras.spellcheck_collation}</strong></a> ?
                        </small>
                    </p>
                {/if}

                {* PAROLE ESCLUSE *}
                {if $stop_word_array}
                    <p class="Prose u-margin-bottom-l">
                        <small>{"The following words were excluded from the search"|i18n("design/base")}:
                            {foreach $stop_word_array as $stopWord}
                                {$stopWord.word|wash}
                                {delimiter}, {/delimiter}
                            {/foreach}
                        </small>
                    </p>
                {/if}

                {switch name=feedback match=$count}
                {case match=0}
                    <div class="Prose Alert Alert--warning">
                        {if $search_extras.hasError}
                            <h2>{$search_extras.error|wash}</h2>
                        {elseif $search_text|ne('')}
                            <h2>{'No results were found when searching for "%1".'|i18n("design/ezwebin/content/search",,array($search_text|wash))}</h2>
                            <p>{'Search tips'|i18n('design/ezwebin/content/search')}</p>
                            <ul>
                                <li>{'Check spelling of keywords.'|i18n('design/ezwebin/content/search')}</li>
                                <li>{'Try changing some keywords (eg, "car" instead of "cars").'|i18n('design/ezwebin/content/search')}</li>
                                <li>{'Try searching with less specific keywords.'|i18n('design/ezwebin/content/search')}</li>
                                <li>{'Reduce number of keywords to get more results.'|i18n('design/ezwebin/content/search')}</li>
                            </ul>
                        {else}
                            <h2>Nessun risultato ottenuto</h2>
                            <p>{'Search tips'|i18n('design/ezwebin/content/search')}</p>
                            <ul>
                                <li>Riduci il numero di filtri applicati</li>
                            </ul>
                        {/if}
                    </div>
                {/case}
                {case}
                    <div class="Prose Alert Alert--success">
                        <h2 class="u-text-r-l">
                            {if $search_text|ne('')}
                                <strong>{'Search for "%1" returned %2 matches'|i18n("design/ezwebin/content/search",,array($search_text|wash,$count))}</strong>
                            {else}
                                <strong>La ricerca ha prodotto {$count} risultati</strong>
                            {/if}
                        </h2>
                    </div>
                {/case}
                {/switch}

                {if $count|gt(0)}

                    <div class="ContainerStriped">
                        {foreach $results as $result}
                            {node_view_gui view=ezfind_advanced_line sequence=false() content_node=$result}
                        {/foreach}
                    </div>

                    {include name=Navigator
                             uri='design:navigator/google.tpl'
                             page_uri='content/advancedsearch'
                             page_uri_suffix=$uri_suffix
                             item_count=$count
                             view_parameters=$view_parameters
                             item_limit=$limit}

                {/if}

            </div>

            <div class="extra" id="subnav">

                {if $link_istruzioni_ricerca}
                    <a class="Button Button--info" href="{$link_istruzioni_ricerca.url_alias|ezurl(no)}"
                       title="Link a {$link_istruzioni_ricerca.name|wash()}">
                        {$link_istruzioni_ricerca.name|wash()}
                    </a>
                {/if}


                {if $isSingleClassSearch}
                    <a class="Button Button--info" href={concat( "/content/advancedsearch/", cond( is_area_tematica(), concat( '?SubTreeArray[]=', is_area_tematica().node_id ), '' ) )|ezurl()}>Annulla tutti i filtri</a>
                    <div class="openpa-widget nav-section u-margin-top-l">
                        {include name = searchform
                        uri = 'design:parts/class_search_form.tpl'
                        class = $Class
                        subtree = $Subtree
                        open_advanced = true()
                        exclude_attributes = openpaini( 'GestioneAttributi', 'attributi_da_escludere_dalla_ricerca', array() )}
                    </div>

                {elseif and( is_set($search_extras.facet_fields.0.nameList), $search_extras.facet_fields.0.nameList|gt(0) )}
                    <div class="openpa-widget nav-section">

                        <fieldset class="Form-field Form-field--choose Grid-cell">
                            <legend class="openpa-widget-title">
                                {if $Classes|count()|gt(1)}Stai filtrando per:{else}Restringi la ricerca a:{/if}
                            </legend>
                            <div class="u-padding-all-s u-background-grey-10">
                                {def $faccette = $search_extras.facet_fields.0.nameList}
                                {set $faccette = $faccette|asort()}
                                {foreach $faccette as $classId => $name}
                                    {if $not_available_facets.ids|contains($classId)|not()}
                                        <label class="Form-label Form-label--block" for="facet-{$classId}">
                                            <input class="Form-input"
                                                   id="facet-{$classId}"
                                                   value="{$classId}"
                                                   title="{$name|wash}"
                                                   name="ClassArray[]"
                                                   type="checkbox"
                                                    {if and( $Classes, $Classes|contains($classId) )} checked="checked"{/if}/>
                                            <span class="Form-fieldIcon" role="presentation"></span> {$name|wash}
                                            ({$search_extras.facet_fields.0.countList[$classId]})
                                        </label>
                                    {/if}
                                {/foreach}
                            </div>
                        </fieldset>
                        <input class="Button Button--info u-text-r-xs" name="SearchButton" type="submit"
                               value="{'Search'|i18n('design/ezwebin/content/search')}"/>

                    </div>

                {/if}

            </div>

        </div>

    </form>
</div>
