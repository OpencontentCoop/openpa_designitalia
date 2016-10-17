<div class="openpa-widget {$block.view} {if is_set($block.custom_attributes.color_style)}color color-{$block.custom_attributes.color_style}{/if}">
    <h3 class="openpa-widget-title">{$block.name|wash()}</h3>
    <div class="openpa-widget-content">

        <form id="search-form-{$block.id}" action="{'ezajax/search'|ezurl('no')}" method="post">
            <fieldset>
                <legend class="hide">{$block.name}</legend>
                <input id="search-string-{$block.id}" type="text" name="SearchStr" value="" />
                <input id="search-button-{$block.id}" class="button" type="submit" name="SearchButton" value="Search" />

                <ul id="search-results-{$block.id}" class="list-unstyled"></ul>

                {ezscript_require( array( 'ezjsc::yui3', 'ezjsc::yui3io', 'ezajaxsearch.js' ) )}

                <script type="text/javascript">
                eZAJAXSearch.cfg = {ldelim}
                                        searchstring: '#search-string-{$block.id}',
                                        searchbutton: '#search-button-{$block.id}',
                                        searchresults: '#search-results-{$block.id}',
                                        resulttemplate: '<li><a href="{ldelim}url_alias{rdelim}">{ldelim}title{rdelim}</a><small>[{ldelim}class_name{rdelim}] {ldelim}date{rdelim}</small></li>'
                                   {rdelim};
                eZAJAXSearch.init();
                </script>


            </fieldset>
        </form>

    </div>
</div>