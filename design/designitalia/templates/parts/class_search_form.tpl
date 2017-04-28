{*
  $class eZContentClass
  $subtree
  $exclude_attributes array
  $open_advanced
*}

<div class="u-padding-all-s u-background-grey-10">

    {def $SearchText = cond( ezhttp( 'SearchText','get','hasVariable' ), ezhttp( 'SearchText', 'get' ) )}
    {def $Data = cond( ezhttp( 'Data','get','hasVariable' ), ezhttp( 'Data', 'get' ) )}
    {def $Sort = cond( ezhttp( 'Sort','get','hasVariable' ), ezhttp( 'Sort', 'get' ) )}
    {def $Order = cond( ezhttp( 'Order','get','hasVariable' ), ezhttp( 'Order', 'get' ) )}

    {def $attributes = array()
    $facetAttributeIdentifier = array()
    $facetQuery = array()}
    {foreach $class.data_map as $attribute}
        {if and($attribute.is_searchable, $exclude_attributes|contains($attribute.identifier)|not(), $exclude_attributes|contains(concat($class.identifier,'/',$attribute.identifier))|not())}
            {set $attributes = $attributes|append($attribute)}
            {if $attribute.data_type_string|eq('ezobjectrelationlist')}
                {set $facetAttributeIdentifier = $facetAttributeIdentifier|append($attribute.identifier)}
                {set $facetQuery = $facetQuery|append(concat($attribute.identifier,'.id|count|100'))}
            {/if}
        {/if}
    {/foreach}

    {def $availableValues = array()}
    {if count($facetQuery)|gt(0)}
        {def $subtreeQuery = ''}
        {if is_array($subtree)}
            {set $subtreeQuery = concat( ' subtree [', $subtree|implode(','), '] ')}
        {/if}
        {def $searchForFacets = search_query( concat( 'classes [', $class.identifier, '] facets [', $facetQuery|implode(','), ']', $subtreeQuery, 'limit 1' ) )}
        {if is_set($searchForFacets['SearchExtras'].facet_fields)}
            {foreach $facetAttributeIdentifier as $key => $identifier}
                {if $searchForFacets['SearchExtras'].facet_fields[$key].count|gt(0)}
                    {set $availableValues = $availableValues|merge( hash( $identifier, $searchForFacets['SearchExtras'].facet_fields[$key].countList ) )}
                {/if}
            {/foreach}
        {/if}
    {/if}


    <div class="Form-field">
        <label class="Form-label" for="ClassFormSearchText">Ricerca libera</label>
        <input class="Form-input" type="text" name="SearchText" id="ClassFormSearchText"
               value="{cond(is_set($SearchText),$SearchText|wash())}"/>
        {if $open_advanced|not()}
            <p class="u-padding-top-m u-textRight">
                <a class="collapse u-padding-right-m" data-toggle="collapse"
                   data-target="#OrderSearchPanel-{$class.identifier}">Ordinamento</a>
                <a class="collapse" data-toggle="collapse" data-target="#AdvancedSearchPanel-{$class.identifier}">Avanzata</a>
            </p>
        {/if}
    </div>

    <fieldset {if $open_advanced|not()}style="display: none"{/if} class="Form-fieldset"
              id="OrderSearchPanel-{$class.identifier}">
        <legend class="Form-legend">Ordinamento</legend>
        <div class="Grid">
            <div class="Form-field Grid-cell u-sizeFull u-sm-size1of2 u-md-size1of2 u-lg-size1of2">
                <label class="Form-label u-hiddenVisually" for="Sort">Ordina per</label>
                <select class="Form-input" id="Sort" name="Sort">
                    <option {if and( is_set($Sort), $Sort|eq('published') )} selected="selected"{/if} value="published">
                        Data di pubblicazione
                    </option>
                    <option {if and( is_set($Sort), $Sort|eq('score'))} selected="selected"{/if} value="score">
                        Rilevanza
                    </option>
                    <option {if and( is_set($Sort), $Sort|eq('name'))} selected="selected"{/if} value="name">Nome
                    </option>
                    {foreach $attributes as $attribute}
                        <option {if and( is_set($Sort), $Sort|eq($attribute.identifier) )} selected="selected"{/if}
                                value="{$attribute.identifier|wash()}">{$attribute.name}</option>
                    {/foreach}
                </select>
            </div>

            <div class="Form-field Grid-cell u-sizeFull u-sm-size1of2 u-md-size1of2 u-lg-size1of2">
                <label class="Form-label u-hiddenVisually" for="Order">Ordinamento</label>
                <select class="Form-input" name="Order" id="Order">
                    <option {if and( is_set($Order), $Order|eq('desc') )}selected="selected"{/if} value="desc">
                        Discendente
                    </option>
                    <option {if and( is_set($Order), $Order|eq('asc') )}selected="selected"{/if} value="asc">
                        Ascendente
                    </option>
                </select>
            </div>
        </div>
    </fieldset>

    <fieldset {if $open_advanced|not()}style="display: none"{/if} class="Form-fieldset"
              id="AdvancedSearchPanel-{$class.identifier}">
        <legend class="Form-legend">Avanzata</legend>


        {foreach $attributes as $attribute}
            {switch match=$attribute.data_type_string}

            {case in=array('ezdate', 'ezdatetime')}
                <fieldset class="Grid">
                    <legend class="Form-label">{$attribute.name}</legend>

                    <div class="Form-field Grid-cell u-sizeFull u-sm-size1of2 u-md-size1of2 u-lg-size1of2">
                        <label class="Form-label u-hiddenVisually" for="{$attribute.identifier}_from">Dalla data:</label>
                        <input type="text" class="from_picker Form-input" placeholder="Dalla data"
                               id="{$attribute.identifier}_from"
                               name="Data[{$attribute.identifier}][]" title="Dalla data"
                               value="{cond(is_set($Data[$attribute.identifier]),$Data[$attribute.identifier][0])}"/>
                    </div>
                    <div class="Form-field Grid-cell u-sizeFull u-sm-size1of2 u-md-size1of2 u-lg-size1of2">
                        <label class="Form-label u-hiddenVisually" for="{$attribute.identifier}_to">Alla data:</label>
                        <input class="to_picker Form-input" type="text" placeholder="Alla data"
                               id="{$attribute.identifier}_to"
                               name="Data[{$attribute.identifier}][]" title="Alla data"
                               value="{cond(is_set($Data[$attribute.identifier]),$Data[$attribute.identifier][1])}"/>
                    </div>
                </fieldset>
            {/case}

            {case in=array('ezobjectrelationlist')}
            {if is_set( $availableValues[$attribute.identifier] )}
                <div class="Form-field">
                    <label class="Form-label" for="{$attribute.identifier}">{$attribute.name}</label>
                    <select class="Form-input reorder" name="Data[{$attribute.identifier}][]"
                            id="{$attribute.identifier}">
                        <option value=""> - Seleziona</option>
                        {foreach $availableValues[$attribute.identifier] as $name => $count}
                            {def $api_content = api_read($name)}
                            {if is_set($api_content.metadata)}
                                <option value="{$name|wash()}" {if and(is_set($Data[$attribute.identifier]),$Data[$attribute.identifier]|contains($name))}selected="selected"{/if}>{$api_content.metadata.name['ita-IT']} ({$count})</option>
                            {/if}
                            {undef $api_content}
                        {/foreach}
                    </select>
                </div>
            {/if}
            {/case}

            {case in=array('ezstring','eztext','ezinteger')}
                <div class="Form-field">
                    <label class="Form-label" for="{$attribute.identifier}">{$attribute.name}</label>
                    <input id="{$attribute.identifier}"
                           type="text"
                           class="Form-input"
                           name="Data[{$attribute.identifier}]"
                           value="{cond(is_set($Data[$attribute.identifier]),$Data[$attribute.identifier])}"/>
                </div>
            {/case}

            {case}{/case}

            {/switch}
        {/foreach}

        <fieldset class="Grid">
            <legend class="Form-label">Data di pubblicazione</legend>
            <div class="Form-field Grid-cell u-sizeFull u-sm-size1of2 u-md-size1of2 u-lg-size1of2">
                <label class="Form-label u-hiddenVisually" for="published_from">Dalla data:</label>
                <input id="published_from"
                       type="text"
                       class="from_picker Form-input"
                       name="Data[published][]"
                       title="Dalla data"
                       placeholder="Dalla data"
                       value="{cond(is_set($Data['published']),$Data['published'][0])}"/>
            </div>
            <div class="Form-field Grid-cell u-sizeFull u-sm-size1of2 u-md-size1of2 u-lg-size1of2">
                <label class="Form-label u-hiddenVisually" for="published_to">Alla data:</label>
                <input id="published_to"
                       type="text"
                       class="to_picker Form-input"
                       name="Data[published][]"
                       title="Dalla data"
                       placeholder="Alla data"
                       value="{cond(is_set($Data['published']),$Data['published'][1])}"/>
            </div>
        </fieldset>

    </fieldset>

    <div class="Form-field">
        <input id="search-button-button" class="Button Button--info" type="submit" name="SearchButton" value="Cerca"/>
    </div>


    {foreach $subtree as $value}
        <input name="SubTreeArray[]" type="hidden" value="{$value|wash()}"/>
    {/foreach}

    <input name="ClassArray[]" type="hidden" value="{$class.id|wash()}"/>


    <script type="text/javascript">
        {literal}
        $(function () {
            $(".from_picker").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                changeYear: true,
                dateFormat: "dd-mm-yy",
                numberOfMonths: 1

            });
            $(".to_picker").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                changeYear: true,
                dateFormat: "dd-mm-yy",
                numberOfMonths: 1
            });
            $("select.reorder").each(function () {
                var selectedValue = $(this).val();
                $(this).html($("option", $(this)).sort(function (a, b) {
                    return a.text == b.text ? 0 : a.text < b.text ? -1 : 1
                }));
                $(this).val(selectedValue);
            });
        });

        $(".collapse").click(function () {
            $($(this).data('target')).toggle();
        });
        {/literal}
    </script>

</div>
