<!DOCTYPE html>
<!--[if lt IE 9 ]>
<html xmlns="http://www.w3.org/1999/xhtml" class="unsupported-ie ie no-js"
      lang="{$site.http_equiv.Content-language|wash}"><![endif]-->
<!--[if IE 9 ]>
<html xmlns="http://www.w3.org/1999/xhtml" class="ie ie9 no-js"
      lang="{$site.http_equiv.Content-language|wash}"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html xmlns="http://www.w3.org/1999/xhtml"  class="no-js" lang="{$site.http_equiv.Content-language|wash}">
<!--<![endif]-->
<head>

    {def $user_hash_cache_key = concat( $current_user.role_id_list|implode( ',' ), ',', $current_user.limited_assignment_value_list|implode( ',' ) )}

    {if is_set( $extra_cache_key )|not}
        {def $extra_cache_key = ''}
    {/if}

{cache-block keys=array( $module_result.uri, $user_hash_cache_key, $access_type.name, $extra_cache_key )}
    {def $pagedata = openpapagedata()
    $locales = fetch( 'content', 'translation_list' )
    $current_node_id = $pagedata.node_id}

    {include uri='design:page_head.tpl'}
    {include uri='design:page_head_style.tpl'}
    {include uri='design:page_head_script.tpl'}

</head>
<body class="Pac">
    <ul class="Skiplinks js-fr-bypasslinks">
        <li><a accesskey="2" href="#main">Vai al Contenuto</a></li>
        <li><a accesskey="3" href="#menu">Vai alla navigazione del sito</a></li>
    </ul>

    {*<script type="text/javascript">{literal}//<![CDATA[(function () {var c = document.body.className;c = c.replace(/no-js/, 'js');document.body.className = c;})();//]]>{/literal}</script>*}

    {include uri='design:page_browser_alert.tpl'}

    {* Todo: sistemare e riabilitare *}
    {*if and( $pagedata.website_toolbar, array( 'edit', 'browse' )|contains( $ui_context )|not() )}
        {include uri='design:page_toolbar.tpl'}
    {/if*}

    {include uri='design:page_header.tpl'}

    {include uri='design:menu/offcanvas_menu.tpl'}

    {if and( or($pagedata.is_homepage, is_area_tematica()), array( 'edit', 'browse' )|contains( $ui_context )|not() )}
        {include uri='design:header/banner.tpl'}
    {/if}

    {if and( $pagedata.is_homepage|not(), $pagedata.is_search_page|not(), $pagedata.show_path, array( 'edit', 'browse' )|contains( $ui_context )|not(), is_set( $module_result.content_info ) )}
        {include uri='design:breadcrumb.tpl'}
    {/if}

{/cache-block}

    <div id="main">
        {include uri='design:page_mainarea.tpl'}

        {cache-block expiry=86400 keys=array( $module_result.uri, $user_hash_cache_key, $access_type.name, $extra_cache_key )}
            {if is_unset($pagedata)}{def $pagedata = openpapagedata()}{/if}
            {if and( $pagedata.is_login_page|not(), $pagedata.show_path, array( 'edit', 'browse' )|contains( $ui_context )|not() )}
                {include uri='design:page_footer.tpl'}
            {/if}
        {/cache-block}
    </div>

    {* Codice extra usato da plugin javascript *}
    {include uri='design:page_extra.tpl'}

    <!--DEBUG_REPORT-->
    {include uri='design:page_footer_script.tpl'}

</body>
</html>
