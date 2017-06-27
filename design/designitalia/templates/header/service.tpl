{def $header_service = openpaini('GeneralSettings','header_service', 1)}

{if $header_service|eq(1)}
    <div class="Header-banner">
        <div class="Header-owner Headroom-hideme">
            <a href="{openpaini('InstanceSettings','UrlAmministrazioneAfferente', '#')}">
                <span>{openpaini('InstanceSettings','NomeAmministrazioneAfferente', 'Provincia autonoma di Trento')}</span>
            </a>
            {* Blocco multilingua, non utilizzato per ora
            <div class="Header-languages ">
              <a href="#languages" data-menu-trigger="languages" class="Header-language u-border-none u-zindex-max u-inlineBlock">
                <span class="u-hiddenVisually">lingua attiva:</span>
                <span class="">ITA</span>
                <!-- <span class="u-hidden u-md-inlineBlock u-lg-inlineBlock">Italiano</span> -->
                <span class="Icon Icon-expand u-padding-left-xs"></span>
              </a>
              <div id="languages" data-menu class="Dropdown-menu Header-language-other u-jsVisibilityHidden u-nojsDisplayNone">
                <span class="Icon-drop-down Dropdown-arrow u-color-white"></span>
                <ul>
                  <li><a href="#1" class="u-padding-r-all"><span lang="en">English</span></a></li>
                  <li><a href="#1" class="u-padding-r-all"><span lang="ar">عربي</span></a></li>
                  <li><a href="#2" class="u-padding-r-all"><span lang="ch">中文网</span></a></li>
                  <li><a href="#3" class="u-padding-r-all"><span lang="de">Deutsch</span></a></li>
                  <li><a href="#8" class="u-padding-r-all"><span lang="es">Español</span></a></li>
                  <li><a href="#4" class="u-padding-r-all"><span lang="fr">Français</span></a></li>
                  <li><a href="#5" class="u-padding-r-all"><span lang="ja">日本語</span></a></li>
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
