<div class="Header-navbar ">
  <div class="u-layout-wide Grid Grid--alignMiddle u-layoutCenter">

    {include uri='design:header/logo.tpl'}

    {if $pagedata.is_login_page|not()}
      {include uri='design:header/tools.tpl'}
    {/if}

    {if and( $pagedata.is_login_page|not(), array( 'edit', 'browse' )|contains( $ui_context )|not() )}
      <div class="Header-toggle Grid-cell">
        <a class="Hamburger-toggleContainer js-fr-offcanvas-open u-nojsDisplayInlineBlock u-lg-hidden u-md-hidden"
           href="#menu" aria-controls="menu" aria-label="accedi al menu" title="accedi al menu">
          <span class="Hamburger-toggle" role="presentation"></span>
          <span class="Header-toggleText" role="presentation">Menu</span>
        </a>
      </div>
    {/if}

  </div><!-- Header-navbar -->
</div>


{*<div class="Header-navbar ">
  <div class="u-layout-wide Grid Grid--alignMiddle u-layoutCenter">
    <div class="Header-logo Grid-cell" aria-hidden="true">
      <a href="" tabindex="-1">
        <img src="//placehold.it/75x80" alt="">
      </a>
    </div>

    <div class="Header-title Grid-cell">
      <h1 class="Header-titleLink">
        <a href="/">
          Nome della Pubblica Amministrazione<br>
          <small>eventuale sottotitolo</small>
        </a>
      </h1>
    </div>

    <div class="Header-searchTrigger Grid-cell">
      <button aria-controls="header-search" class="js-Header-search-trigger Icon Icon-search "
              title="attiva il form di ricerca" aria-label="attiva il form di ricerca" aria-hidden="false">
      </button>
      <button aria-controls="header-search" class="js-Header-search-trigger Icon Icon-close u-hidden "
              title="disattiva il form di ricerca" aria-label="disattiva il form di ricerca" aria-hidden="true">
      </button>
    </div>

    <div class="Header-utils Grid-cell">
      <div class="Header-social Headroom-hideme">
        <p>Seguici su</p>
        <ul class="Header-socialIcons">
          <li><a href="" title="Facebook"><span class="Icon-facebook"></span><span
                class="u-hiddenVisually">Facebook</span></a></li>
          <li><a href="" title="Twitter"><span class="Icon-twitter"></span><span class="u-hiddenVisually">Twitter</span></a>
          </li>
          <li><a href="" title="Youtube"><span class="Icon-youtube"></span><span class="u-hiddenVisually">Youtube</span></a>
          </li>
        </ul>
      </div>
      <div class="Header-search" id="header-search">
        <form class="Form">
          <div class="Form-field Form-field--withPlaceholder Grid u-background-white u-color-grey-30 u-borderRadius-s"
               role="search">
            <input
              class="Form-input Form-input--ultraLean Grid-cell u-sizeFill u-text-r-s u-color-black u-text-r-xs u-borderRadius-s"
              required id="cerca">
            <label class="Form-label u-color-grey-50 u-text-r-xxs" for="cerca">cerca nel sito</label>
            <button
              class="Grid-cell u-sizeFit Icon-search Icon--rotated u-color-grey-50 u-padding-all-s u-textWeight-700"
              title="Avvia la ricerca" aria-label="Avvia la ricerca">
            </button>
          </div>
        </form>

      </div>
    </div>

    <div class="Header-toggle Grid-cell">
      <a class="Hamburger-toggleContainer js-fr-offcanvas-open u-nojsDisplayInlineBlock u-lg-hidden u-md-hidden"
         href="#menu" aria-controls="menu" aria-label="accedi al menu" title="accedi al menu">
        <span class="Hamburger-toggle" role="presentation"></span>
        <span class="Header-toggleText" role="presentation">Menu</span>
      </a>
    </div>

  </div>
</div>*}
