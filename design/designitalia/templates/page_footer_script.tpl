{if ezini('GeneralSettings','SocialButtons', 'openpa.ini')|eq('enabled')}
  <script src="//s7.addthis.com/js/300/addthis_widget.js#pubid={ezini('GeneralSettings','SocialPubId', 'openpa.ini')}"></script>
{/if}

<!--[if IE 8]>
<script src="{'javascript/vendor/respond.min.js'|ezdesign(no)}"></script>
<script src="{'javascript/vendor/rem.min.js'|ezdesign(no)}"></script>
<script src="{'javascript/vendor/selectivizr.js'|ezdesign(no)}"></script>
<script src="{'javascript/vendor/slice.js'|ezdesign(no)}"></script>
<![endif]-->

<!--[if lte IE 9]>
<script src="{'javascript/vendor/polyfill.min.js'|ezdesign(no)}"></script>
<![endif]-->

<script src="{'javascript/IWT.min.js'|ezdesign(no)}"></script>

{if openpaini( 'Seo', 'GoogleAnalyticsAccountID', false() )}
  <script async src="https://www.googletagmanager.com/gtag/js?id={openpaini( 'Seo', 'GoogleAnalyticsAccountID' )}"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){ldelim}dataLayer.push(arguments);{rdelim}
    gtag('js', new Date());
    gtag('config', '{openpaini( 'Seo', 'GoogleAnalyticsAccountID' )}', {ldelim}{if openpaini('Seo', 'GoogleCookieless')|eq('enabled')}client_storage: 'none', {/if}anonymize_ip: true {rdelim});
  </script>
{/if}

{if openpaini( 'Seo', 'webAnalyticsItaliaID', false() )}
    {* see https://matomo.org/faq/general/faq_157/ *}
  <script type="text/javascript">
    var _paq = window._paq || [];
    {if openpaini('Seo', 'WebAnalyticsItaliaCookieless')|eq('enabled')}_paq.push(['disableCookies']);{/if}
    _paq.push(['trackPageView']);
    _paq.push(['enableLinkTracking']);
    (function() {ldelim}
      var u="https://ingestion.webanalytics.italia.it/";
      _paq.push(['setTrackerUrl', u+'matomo.php']);
      _paq.push(['setSiteId', '{openpaini( 'Seo', 'webAnalyticsItaliaID' )}']);
      var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
      g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'matomo.js'; s.parentNode.insertBefore(g,s);
        {rdelim})();
  </script>
  <!-- End Matomo Code -->
{/if}

{if and(fetch('user','current_user').is_logged_in, openpaini('Monitoring', 'SentryScriptLoader', false()))}
  <script src="{openpaini('Monitoring', 'SentryScriptLoader', false())}" crossorigin="anonymous"></script>
  <script>
    window.Sentry && Sentry.onLoad(function() {ldelim}
      Sentry.init({ldelim}
        environment: "{openpa_instance_identifier()}"
      {rdelim});
    {rdelim});
  </script>
{/if}