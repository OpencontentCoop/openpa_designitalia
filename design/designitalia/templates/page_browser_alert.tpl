{ezscript_require(array('cookiechoices.js'))}
{literal}
<script>
document.addEventListener('DOMContentLoaded', function(event) {
cookieChoices.showCookieConsentBar(
"I cookie ci aiutano ad erogare servizi di qualità. Utilizzando i nostri servizi, l'utente accetta le nostre modalità d'uso dei cookie.",
'OK',
'Maggiori informazioni',
'{/literal}{'openpa/cookie'|ezurl(no,full)}{literal}'
);});
</script>
{/literal}

<!--[if (lt IE 9) | IE 9]>
<div class="alert alert-danger text-center">
    <h4><i class="fa fa-exclamation-triangle"></i> <strong>Attenzione! Questa pagina potrebbe non essere visualizzata correttamente.</strong></h4>
    <p>Stai utilizzando una versione obsoleta di Internet Explorer. Per un'esperienza di navigazione più sicura e performante è consigliabile eseguire un aggiornamento del browser</p>
</div>
<![endif]-->