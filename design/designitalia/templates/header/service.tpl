{def $header_service = openpaini('GeneralSettings','header_service', 1)}

{if $header_service|eq(1)}
    <div class="Header-banner">
        <div class="Header-owner Headroom-hideme">
            <a href="{openpaini('InstanceSettings','UrlAmministrazioneAfferente', '#')}">
                <span>{openpaini('InstanceSettings','NomeAmministrazioneAfferente', 'Provincia autonoma di Trento')}</span>
            </a>

            {include uri='design:page_header_languages.tpl'}

          {* Blocco multilingua, non utilizzato per ora
            <div class="Header-languages">
                <a class="Header-language is-active u-hidden u-md-inlineBlock u-lg-inlineBlock" href="" title="sito in italiano">
                    <abbr title="Italiano">ITA</abbr>
                </a>
                <a class="Header-language u-hidden u-md-inlineBlock u-lg-inlineBlock" href="" title="website in english" lang="en">
                    <abbr title="English">ENG</abbr>
                </a>
                <a href="#languages" data-menu-trigger="languages" class="Header-language u-border-none u-zindex-max is-active u-inlineBlock">
                    <span class="u-hiddenVisually">lingua attiva:</span>
                    <span class="u-md-hidden u-lg-hidden">ITA</span>
                    <span class="Icon Icon-expand u-padding-left-xs u-md-hidden u-lg-hidden"></span>
                    <span class="Icon Icon-more-actions u-padding-left-xxs u-padding-right-xxs u-hidden u-md-inlineBlock u-lg-inlineBlock"></span>
                </a>
                <div id="languages" data-menu class="Dropdown-menu Header-language-other u-jsDisplayNone u-nojsDisplayNone">
                    <ul class="Linklist">
                        <li><a href="#1" class="u-padding-r-all"><span lang="en">English</span></a></li>
                        <li><a href="#1" class="u-padding-r-all"><span lang="ar">عربي</span></a></li>
                        <li><a href="#2" class="u-padding-r-all"><span lang="ch">中文网</span></a></li>
                        <li><a href="#3" class="u-padding-r-all"><span lang="de">Deutsch</span></a></li>
                        <li><a href="#8" class="u-padding-r-all"><span lang="es">Español</span></a></li>
                        <li><a href="#4" class="u-padding-r-all"><span lang="fr">Français</span></a></li>
                        <li><a href="#5" class="u-padding-r-all"><span lang="jp">日本語</span></a></li>
                        <li><a href="#6" class="u-padding-r-all"><span lang="pt">Portuguese</span></a></li>
                        <li><a href="#7" class="u-padding-r-all"><span lang="ru">НА РУССКОМ</span></a></li>
                        <li><a href="#10" class="u-padding-r-all"><span lang="uk">УКРАЇНСЬКA</span></a></li>
                        <li><a href="#9" class="u-padding-r-all"><span lang="tr">TÜRKÇE</span></a></li>
                    </ul>
                </div>
            </div>
*}
        </div>
    </div>
{/if}