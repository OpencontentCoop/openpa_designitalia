<!--[if IE 8]>
<script src="{'javascript/respond.min.js'|ezdesign(no)}"></script>
<script src="{'javascript/rem.min.js'|ezdesign(no)}"></script>
<script src="{'javascript/selectivizr.js'|ezdesign(no)}"></script>
<script src="{'javascript/slice.js'|ezdesign(no)}"></script>
<![endif]-->

<!--[if lte IE 9]>
<script src="{'javascript/polyfill.min.js'|ezdesign(no)}"></script>
<![endif]-->

<script src="{'javascript/IWT.min.js'|ezdesign(no)}"></script>

{if openpaini( 'Seo', 'GoogleAnalyticsAccountID', false() )}
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', '{openpaini( 'Seo', 'GoogleAnalyticsAccountID' )}']);  
  _gaq.push(['_setAllowLinker', true]);
  _gaq.push(['_trackPageview']);
  (function() {ldelim}
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  {rdelim})();
</script>
{/if}