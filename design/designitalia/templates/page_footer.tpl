{def $footerBlocksClass = 'u-md-size1of2 u-lg-size1of2'}
{if or(is_set($pagedata.contacts.facebook), is_set($pagedata.contacts.twitter), is_set($pagedata.contacts.linkedin), is_set($pagedata.contacts.instagram))}
    {set $footerBlocksClass = 'u-md-size1of3 u-lg-size1of3'}
{/if}

{if and( $ui_context|ne( 'edit' ), $ui_context|ne( 'browse' ) )}
    {if $pagedata.class_identifier|ne('')}
        <div class="survey u-background-95 u-textCenter u-padding-all-s">
            <a href="#"
               onClick="getElementById('openpa-valuation').style.display='block';return false;"
               class="u-linkClean u-color-white">
                <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Valuta questo sito
            </a>
            <div style="display: none" id="openpa-valuation">
                {include name=valuation node_id=$current_node_id uri='design:openpa/valuation.tpl'}
            </div>
        </div>
    {/if}
{/if}


<footer class="Footer u-padding-all-s">
    <div class="u-layout-wide u-layoutCenter">
        <div class="u-cf">

            {if and( is_set($pagedata.header.logo.url), $pagedata.header.logo.url)}
                <img height="75" class="Footer-logo"
                     src="{$pagedata.header.logo.url|ezroot(no)}"
                     alt="{ezini('SiteSettings','SiteName')}"/>
            {else}
                <img class="Footer-logo" src="//placehold.it/75x80?text=placeholder" alt="">
            {/if}
            <p class="Footer-siteName">{ezini('SiteSettings','SiteName')}</p>
        </div>

        <div class="Grid Grid--withGutter">

            {def $footer_notes = fetch( 'openpa', 'footer_notes' )}
            {if $footer_notes}
                <div class="Footer-block Grid-cell {$footerBlocksClass}">
                    <h2 class="Footer-blockTitle">Informazioni</h2>
                    <div class="Footer-subBlock">
                        <div class="u-lineHeight-xl u-color-white">
                            {attribute_view_gui attribute=$footer_notes}
                        </div>
                    </div>
                </div>
            {/if}

            <div class="Footer-block Grid-cell {$footerBlocksClass}">
                <h2 class="Footer-blockTitle">Contatti</h2>
                {include uri='design:footer/contacts_list.tpl'}
            </div>

            {if or(is_set($pagedata.contacts.facebook), is_set($pagedata.contacts.twitter), is_set($pagedata.contacts.linkedin), is_set($pagedata.contacts.instagram))}
                <div class="Footer-block Grid-cell {$footerBlocksClass}">
                    <h2 class="Footer-blockTitle">Seguici su</h2>
                    <div class="Footer-subBlock">
                        <ul class="Footer-socialIcons">
                            {if is_set($pagedata.contacts.facebook)}
                                <li>
                                    <a href="{$pagedata.contacts.facebook}">
                                        <span class="openpa-icon fa-stack">
                                            <i class="fa fa-circle fa-stack-2x"></i>
                                            <i class="fa fa-facebook fa-stack-1x u-color-grey-80"
                                               aria-hidden="true"></i>
                                        </span>
                                        <span class="u-hiddenVisually">Facebook</span>
                                    </a>
                                </li>
                            {/if}
                            {if is_set($pagedata.contacts.twitter)}
                                <li>
                                    <a href="{$pagedata.contacts.twitter}">
                                        <span class="openpa-icon fa-stack">
                                            <i class="fa fa-circle fa-stack-2x"></i>
                                            <i class="fa fa-twitter fa-stack-1x u-color-grey-80" aria-hidden="true"></i>
                                        </span>
                                        <span class="u-hiddenVisually">Twitter</span>
                                    </a>
                                </li>
                            {/if}
                            {if is_set($pagedata.contacts.linkedin)}
                                <li>
                                    <a href="{$pagedata.contacts.linkedin}">
                                        <span class="openpa-icon fa-stack">
                                            <i class="fa fa-circle fa-stack-2x"></i>
                                            <i class="fa fa-linkedin fa-stack-1x u-color-grey-80"
                                               aria-hidden="true"></i>
                                        </span>
                                        <span class="u-hiddenVisually">Linkedin</span>
                                    </a>
                                </li>
                            {/if}
                            {if is_set($pagedata.contacts.instagram)}
                                <li>
                                    <a href="{$pagedata.contacts.instagram}">
                                        <span class="openpa-icon fa-stack">
                                            <i class="fa fa-circle fa-stack-2x"></i>
                                            <i class="fa fa-instagram fa-stack-1x u-color-grey-80"
                                               aria-hidden="true"></i>
                                        </span>
                                        <span class="u-hiddenVisually">Instagram</span>
                                    </a>
                                </li>
                            {/if}
                        </ul>
                    </div>
                </div>
            {/if}

        </div>

        {def $footer_links = fetch( 'openpa', 'footer_links' )}
        {if count( $footer_links )}
            <ul class="Footer-links u-cf">
                {foreach $footer_links as $item}
                    {def $href = $item.url_alias|ezurl(no)}
                    {if eq( $ui_context, 'browse' )}
                        {set $href = concat("content/browse/", $item.node_id)|ezurl(no)}
                    {elseif $pagedata.is_edit}
                        {set $href = '#'}
                    {elseif and( is_set( $item.data_map.location ), $item.data_map.location.has_content )}
                        {set $href = $item.data_map.location.content}
                    {/if}
                    <li><a href="{$href}"
                           title="Leggi {$item.name|wash()}">{$item.name|wash()}</a>
                    </li>
                    {undef $href}
                {/foreach}
            </ul>
        {/if}

        <div class="Grid Grid--withGutter">
            <div class="Footer-block Grid-cell u-md-size3of5 u-lg-size3of5">
                {include uri='design:footer/copyright.tpl'}
            </div>
            <div class="Footer-block Grid-cell u-md-size2of5 u-lg-size2of5 text-right">
                {if $pagedata.is_login_page|not()}
                    {include uri='design:footer/user_access.tpl'}
                {/if}
            </div>
        </div>
    </div>
</footer>


<a href="#" title="torna all'inizio del contenuto" class="ScrollTop js-scrollTop js-scrollTo">
    <i class="ScrollTop-icon Icon-arrow-up" aria-hidden="true"></i>
    <span class="u-hiddenVisually">torna all'inizio del contenuto</span>
</a>
