<div class="Header-navbar Grid Grid--alignMiddle">
    {if and( $pagedata.is_login_page|not(), array( 'edit', 'browse' )|contains( $ui_context )|not() )}
        <div class="Header-toggle Grid-cell">
            <a class="Hamburger-toggleContainer js-fr-offcanvas-open u-nojsDisplayInlineBlock" href="#menu"
               aria-controls="menu" aria-label="accedi al menu" title="accedi al menu">
                <span class="Hamburger-toggle" role="presentation"></span>
                <span class="Header-toggleText" role="presentation">Menu</span>
            </a>
        </div>
    {/if}

    {include uri='design:header/logo.tpl'}

    {if $pagedata.is_login_page|not()}
        {include uri='design:header/tools.tpl'}
    {/if}

</div><!-- Header-navbar -->
