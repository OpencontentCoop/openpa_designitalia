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
  <script type="text/javascript">
    (function(i,s,o,g,r,a,m){ldelim}i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){ldelim}
      (i[r].q=i[r].q||[]).push(arguments){rdelim},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    {rdelim})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
    ga('create', '{openpaini( 'Seo', 'GoogleAnalyticsAccountID' )}', 'auto');
    ga('set', 'anonymizeIp', true);
    ga('set', 'forceSSL', true);
    ga('send', 'pageview');
  </script>
{/if}
