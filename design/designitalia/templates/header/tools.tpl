{def $area_tematica_links = array()}
{if is_area_tematica()}
    {set $area_tematica_links = fetch( 'content', 'related_objects', hash( 'object_id', is_area_tematica().contentobject_id, 'attribute_identifier', 'area_tematica/link' ))}
{/if}

<div class="Header-searchTrigger Grid-cell">
    <button aria-controls="header-search" class="js-Header-search-trigger Icon Icon-search"
            title="attiva il form di ricerca" aria-label="attiva il form di ricerca" aria-hidden="false">
    </button>
    <button aria-controls="header-search" class="js-Header-search-trigger Icon Icon-close u-hidden"
            title="disattiva il form di ricerca" aria-label="disattiva il form di ricerca" aria-hidden="true">
    </button>
</div>

<div class="Header-utils Grid-cell">
    <div class="Header-social Headroom-hideme">
        {if or(is_set($pagedata.contacts.facebook), is_set($pagedata.contacts.twitter), is_set($pagedata.contacts.linkedin), is_set($pagedata.contacts.instagram))}
            <p>Seguici su:</p>
            <ul class="Header-socialIcons">
                {if is_set($pagedata.contacts.facebook)}
                    <li>
                        <a href="{$pagedata.contacts.facebook}">
                            <span class="openpa-icon fa-stack">
                                <i class="fa fa-circle fa-stack-2x fa-inverse"></i>
                                <i class="fa fa-facebook fa-stack-1x u-color-50" aria-hidden="true"></i>
                            </span>
                            <span class="u-hiddenVisually">Facebook</span>
                        </a>
                    </li>
                {/if}
                {if is_set($pagedata.contacts.twitter)}
                    <li>
                        <a href="{$pagedata.contacts.twitter}">
                            <span class="openpa-icon fa-stack">
                                <i class="fa fa-circle fa-stack-2x fa-inverse"></i>
                                <i class="fa fa-twitter fa-stack-1x u-color-50" aria-hidden="true"></i>
                            </span>
                            <span class="u-hiddenVisually">Twitter</span>
                        </a>
                    </li>
                {/if}
                {if is_set($pagedata.contacts.linkedin)}
                    <li>
                        <a href="{$pagedata.contacts.linkedin}">
                            <span class="openpa-icon fa-stack">
                                <i class="fa fa-circle fa-stack-2x fa-inverse"></i>
                                <i class="fa fa-linkedin fa-stack-1x u-color-50" aria-hidden="true"></i>
                            </span>
                            <span class="u-hiddenVisually">Linkedin</span>
                        </a>
                    </li>
                {/if}
                {if is_set($pagedata.contacts.instagram)}
                    <li>
                        <a href="{$pagedata.contacts.instagram}">
                            <span class="openpa-icon fa-stack">
                                <i class="fa fa-circle fa-stack-2x fa-inverse"></i>
                                <i class="fa fa-instagram fa-stack-1x u-color-50" aria-hidden="true"></i>
                            </span>
                            <span class="u-hiddenVisually">Instagram</span>
                        </a>
                    </li>
                {/if}
            </ul>
        {/if}
    </div>
    <div class="Header-search" id="header-search">
        <form class="Form" action="{"/content/search"|ezurl(no)}">
            <div class="Form-field Form-field--withPlaceholder Grid">

                {if is_area_tematica()}
                    <input type="hidden" value="{is_area_tematica().node_id}" name="SubTreeArray[]" />
                    <input type="text" id="cerca" class="Form-input Grid-cell u-sizeFill u-text-r-s" name="SearchText" {if $pagedata.is_edit}disabled="disabled"{/if}>
                    <label class="Form-label" for="cerca">Cerca in {is_area_tematica().name|wash()}</label>
                {else}
                    <input type="text" id="cerca" class="Form-input Grid-cell u-sizeFill u-text-r-s" name="SearchText" {if $pagedata.is_edit}disabled="disabled"{/if}>
                    <label class="Form-label" for="cerca">Cerca nel sito</label>
                {/if}

                <button type="submit" value="cerca" name="SearchButton" {if $pagedata.is_edit}disabled="disabled"{/if} class="Grid-cell u-sizeFit Icon-search u-background-40 u-color-white u-padding-all-s u-textWeight-700"
                        title="Avvia la ricerca" aria-label="Avvia la ricerca">
                </button>
            </div>
            {if eq( $ui_context, 'browse' )}
                <input name="Mode" type="hidden" value="browse" />
            {/if}
        </form>
    </div>
</div>

