{def $area_tematica_links = array()}
{if is_area_tematica()}
    {set $area_tematica_links = fetch( 'content', 'related_objects', hash( 'object_id', is_area_tematica().contentobject_id, 'attribute_identifier', 'area_tematica/link' ))}
{/if}

{*<div class="navtools">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-8 col-md-offset-1">
                <ul class="list-inline">
                    {if $area_tematica_links|count()}
                        {foreach $area_tematica_links as $link}
                            <li class="hidden-xs hidden-sm">{node_view_gui content_node=$link view="text_linked"}</li>
                        {/foreach}
                    {else}
                        {foreach $pagedata.header.links as $link}
                            <li class="hidden-xs hidden-sm">{node_view_gui content_node=$link view="text_linked"}</li>
                        {/foreach}
                    {/if}

                    {if is_set( $pagedata.contacts.telefono )}
                        <li>
                            {def $tel = strReplace($pagedata.contacts.telefono,array(" ",""))}
                            <a href="tel:{$tel}">
                                <i class="fa fa-phone-square fa-2x"></i>
                                <span class="hidden-xs hidden-sm {if $area_tematica_links|count()}sr-only{/if}">{$pagedata.contacts.telefono}</span>
                            </a>
                        </li>
                    {/if}

                    {if is_set( $pagedata.contacts.email )}
                        <li>
                            <a href="mailto:{$pagedata.contacts.email}">
                                <i class="fa fa-envelope-o fa-2x"></i>
                                <span class="hidden-xs hidden-sm {if $area_tematica_links|count()}sr-only{/if}">{$pagedata.contacts.email}</span>
                            </a>
                        </li>
                    {/if}

                    {if is_set($pagedata.contacts.facebook)}
                        <li>
                            <a href="{$pagedata.contacts.facebook}">
                                <i class="fa fa-facebook-square fa-2x"></i>
                            </a>
                        </li>
                    {/if}

                    {if is_set($pagedata.contacts.twitter)}
                        <li>
                            <a href="{$pagedata.contacts.twitter}">
                                <i class="fa fa-twitter fa-2x"></i>
                            </a>
                        </li>
                    {/if}

                    {if is_set($pagedata.contacts.linkedin)}
                        <li>
                            <a href="{$pagedata.contacts.linkedin}">
                                <i class="fa fa-linkedin fa-2x"></i>
                            </a>
                        </li>
                    {/if}

                    {if is_set($pagedata.contacts.instagram)}
                        <li>
                            <a href="{$pagedata.contacts.instagram}">
                                <i class="fa fa-instagram fa-2x"></i>
                            </a>
                        </li>
                    {/if}
                </ul>
            </div>

            <div class="col-xs-12 col-sm-6 col-md-3">
                <form class="navbar-form" action="{"/content/search"|ezurl(no)}" role="search">
                    <div class="input-group">
                        <label class="hide" for="cerca">cerca</label>
                        {if is_area_tematica()}
                          <input type="hidden" value="{is_area_tematica().node_id}" name="SubTreeArray[]" />
                          <input type="text" id="cerca" class="form-control" placeholder="Cerca in {is_area_tematica().name|wash()}" name="SearchText" {if $pagedata.is_edit}disabled="disabled"{/if}>
                        {else}
                          <input type="text" id="cerca" class="form-control" placeholder="Cerca nel sito" name="SearchText" {if $pagedata.is_edit}disabled="disabled"{/if}>
                        {/if}						
                        <div class="input-group-btn">
                            <button class="btn btn-link" type="submit" value="cerca" name="SearchButton" {if $pagedata.is_edit}disabled="disabled"{/if}><i class="fa fa-search fa-lg"></i><span class="hide">Pulsante ricerca</span></button>                          
                            {if eq( $ui_context, 'browse' )}
                                <input name="Mode" type="hidden" value="browse" />
                            {/if}                            
                        </div>
                    </div>
                </form>
            </div>

        </div>

    </div>
</div>*}


<div class="Header-searchTrigger Grid-cell">
    <button aria-controls="#header-search" class="js-Header-search-trigger Icon Icon-search"
            title="attiva il form di ricerca" aria-label="attiva il form di ricerca" aria-hidden="false">
    </button>
    <button aria-controls="#header-search" class="js-Header-search-trigger Icon Icon-close u-hiddenVisually"
            title="disattiva il form di ricerca" aria-label="disattiva il form di ricerca" aria-hidden="true">
    </button>
</div>

<div class="Header-utils Grid-cell">
    <div class="Header-social Headroom-hideme">
        <p>Seguici su:</p>
        <ul class="Header-socialIcons">
            {if is_set($pagedata.contacts.facebook)}
                <li><a href="{$pagedata.contacts.facebook}"><span class="Icon-facebook"></span><span class="u-hiddenVisually">Facebook</span></a></li>
            {/if}
            {if is_set($pagedata.contacts.twitter)}
                <li><a href="{$pagedata.contacts.twitter}"><span class="Icon-twitter"></span><span class="u-hiddenVisually">Twitter</span></a></li>
            {/if}
            {*<li><a href=""><span class="Icon-youtube"></span><span class="u-hiddenVisually">Youtube</span></a></li>*}
        </ul>
    </div>
    <div class="Header-search" id="header-search">
        <form class="Form">
            <div class="Form-field Form-field--withPlaceholder Grid">

                {if is_area_tematica()}
                    <input type="hidden" value="{is_area_tematica().node_id}" name="SubTreeArray[]" />
                    <input type="text" id="cerca" class="Form-input Grid-cell u-sizeFill u-text-r-s" name="SearchText" required {if $pagedata.is_edit}disabled="disabled"{/if}>
                    <label class="Form-label" for="cerca">Cerca in {is_area_tematica().name|wash()}</label>
                {else}
                    <input type="text" id="cerca" class="Form-input Grid-cell u-sizeFill u-text-r-s" name="SearchText" required {if $pagedata.is_edit}disabled="disabled"{/if}>
                    <label class="Form-label" for="cerca">Cerca nel sito</label>
                {/if}

                <button type="submit" value="cerca" name="SearchButton" {if $pagedata.is_edit}disabled="disabled"{/if} class="Grid-cell u-sizeFit Icon-search u-background-60 u-color-white u-padding-all-s u-textWeight-700"
                        title="Avvia la ricerca" aria-label="Avvia la ricerca">
                </button>
            </div>
            {if eq( $ui_context, 'browse' )}
                <input name="Mode" type="hidden" value="browse" />
            {/if}
        </form>

    </div>

    {* Todo: Non utilizzato per il momento *}
    {*<div class="Header-languages Headroom-hideme">
        <a class="Header-language is-active" href="" title="sito in italiano">ITA</a>
        <a class="Header-language" href="" title="sito in inglese">ENG</a>
    </div>*}
</div>

