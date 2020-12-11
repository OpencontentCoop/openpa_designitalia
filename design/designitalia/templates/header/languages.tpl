{def $lang_selector = array()
     $avail_translation = array()}
{if and( is_set( $DesignKeys:used.url_alias ), $DesignKeys:used.url_alias|count|ge( 1 ) )}
    {set $avail_translation = language_switcher( $DesignKeys:used.url_alias )}
{else}
    {set $avail_translation = language_switcher( $site.uri.original_uri )}
{/if}

{if $avail_translation|count|gt( 1 )}

  {def $current_language = false()
       $available_languages = array()}
  {foreach $avail_translation as $siteaccess => $lang}
    {if is_set($lang.locale)}
        {if $siteaccess|eq( $access_type.name )}
          {set $current_language = $lang}
        {else}
          {set $available_languages = $available_languages|append($lang)}
        {/if}
    {/if}
  {/foreach}

  <div class="Header-languages ">
      <a href="#languages" data-menu-trigger="languages" class="Header-language u-border-none u-zindex-max u-inlineBlock" aria-controls="languages" aria-haspopup="true" role="button">
        <span class="u-hiddenVisually">Lingua attiva:</span>
        <span class="">{$current_language.text|wash|upcase}</span>
        <span class="Icon Icon-expand u-padding-left-xs"></span>
      </a>
      <div id="languages" data-menu="" class="Dropdown-menu Header-language-other u-jsVisibilityHidden u-nojsDisplayNone" style="position: absolute; transform: translate3d(1366px, 36px, 0px); top: 0px; left: 0px; will-change: transform;" role="menu" aria-hidden="true">
        <span class="Icon-drop-down Dropdown-arrow u-color-white" style="left: 59px;"></span>
        <ul>
          <li role="menuitem" class="is-selected"><a href="{$current_language.url|ezurl(no)}" class="u-padding-r-all"><span lang="{fetch(content, locale, hash(locale_code, $current_language.locale)).http_locale_code|explode('-')[0]}">{$current_language.text|wash|upcase}</span></a></li>
          {foreach $available_languages as $lang}
          <li role="menuitem"><a href="{$lang.url|ezurl(no)}" title="{$lang.text|wash|upcase}" class="u-padding-r-all"><span lang="{fetch(content, locale, hash(locale_code, $lang.locale)).http_locale_code|explode('-')[0]}">{$lang.text|wash|upcase}</span></a></li>
          {/foreach}
        </ul>
      </div>
      {if and(is_set($access_link), $access_link)}
        <a href="{$access_link}" style="height: 1px;display: inline-block;">
              <span class="fa-stack u-color-white">
                <i class="fa fa-circle fa-stack-2x"></i>
                <i class="fa fa-user fa-stack-1x" style="color:#30373d"></i>
              </span>
          <span class="u-color-white Breadcrumb-link">Accedi all'area personale</a>
        </a>
      {/if}
  </div>
  {undef $current_language $available_languages}
{elseif and(is_set($access_link), $access_link)}
  <div class="Header-languages ">
    <a href="{$access_link}" style="height: 1px;display: inline-block;">
      <span class="fa-stack u-color-white">
        <i class="fa fa-circle fa-stack-2x"></i>
        <i class="fa fa-user fa-stack-1x" style="color:#30373d"></i>
      </span>
      <span class="u-color-white Breadcrumb-link">Accedi all'area personale</a>
    </a>
  </div>
{/if}
{undef $lang_selector}
