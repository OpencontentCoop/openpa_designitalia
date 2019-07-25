{ezscript_require(array(
  "password-score/password-score.js",
  "password-score/password-score-options.js",
  "password-score/bootstrap-strength-meter.js",
  "password-score/password.js"
))}
{ezcss_require(array('password-score/password.css'))}
<div class="Prose u-padding-bottom-xxl">
  {if $link}
    <h1>Controlla la posta elettronica</h1>
    <p>
      E' stata inviata una mail all'indirizzo: {$email}. <br/>
      L'email contiene il link per generare una nuova password.
    </p>
  {else}
    {if $wrong_email}
      <div class="warning">
        <p>L'indirizzo email inserito non &egrave; presente nel sistema</p>
      </div>
    {/if}
    {if $password_form}
      {if $password_changed}
        <div class="message-feedback">
          <p>
            La password &egrave; stata cambiata con successo.
          </p>
        </div>
        <p><a class="Button" href="/">Vai al sito</a></p>
      {else}
        {if $newPasswordNotMatch}
          <div class="warning">
            <p>Inserisci la stessa password in entrambi i campi.</p>
          </div>
        {/if}
        {if $newPasswordNotValidate}
          <div class="warning">
            <p>La password non &egrave valida. Scegline un'altra</p>
          </div>
        {/if}
        {if $newPasswordMustDiffer}
          <div class="warning">
            <p>La nuova password deve essere diversa da quella vecchia. Scegline un'altra.</p>
          </div>
        {/if}
        <form method="post" name="forgotpassword" action={concat("/userpaex/forgotpassword/",$HashKey)|ezurl}>
          <div class="attribute-header">
            <h1>Scegli una nuova password</h1>
          </div>

          <div class="u-padding-top-m">
            <label for="password">Password:</label>
            <input id="pwd-input" class="Form-input" type="password" name="NewPassword" size="20" value=""/>
            {include uri='design:parts/password_meter.tpl'}
          </div>
          <div class="u-padding-top-m">
            <label for="password">Conferma password::</label>
            <input class="Form-input" type="password" name="NewPasswordConfirm" size="20" value=""/>
          </div>

          <div class="u-padding-top-m">
            <input class="Button Button--default" type="submit" name="ChangePasswdButton" value="OK"/>
            <input type="hidden" name="HashKey" value="{$HashKey}"/>
          </div>
        </form>
      {/if}
    {else}
      {if $wrong_key}
        <div class="warning">
          <p>Chiave non valida o gi&agrave; usata</p>
        </div>
      {else}
        <form method="post" name="forgotpassword" action={"/userpaex/forgotpassword/"|ezurl}>
          <div class="attribute-header">
            <h1>Password dimenticata?</h1>
          </div>

          <p>
            Se hai dimenticato la password possiamo generartene una nuova. Tutto quello che devi fare &egrave; inserire
            il tuo indirizzo di posta elettronica.
          </p>

          <div class="Grid u-padding-top-m">
            <div class="Form-field Grid-cell u-sizeFull u-sm-size2of4 u-md-size3of4 u-lg-size3of4">
              <label class="Form-label u-hidden"
                     for="UserEmail">{"Email"|i18n('mbpaex/userpaex/forgotpassword')}</label>
              <input style="padding: .6em 1.2em;" class="Form-input" type="text" name="UserEmail" size="40"
                     placeholder="{"Email"|i18n('mbpaex/userpaex/forgotpassword')}" value="{$wrong_email|wash}"/>
            </div>

            <div class="Form-field Grid-cell u-sizeFull u-sm-size2of4 u-md-size1of4 u-lg-size1of4">
              <input class="Button Button--default" type="submit" name="GenerateButton"
                     value="Genera una nuova password"/>
            </div>
          </div>
        </form>
      {/if}
    {/if}
  {/if}
</div>

{literal}
<script type="text/javascript">
  $(document).ready(function() {
    $('#pwd-input').password({
      minLength:{/literal}{ezini('UserSettings', 'MinPasswordLength')}{literal},
      message: "{/literal}{'Show/hide password'|i18n('ocbootstrap')}{literal}",
      hierarchy: {
        '0':  ['u-color-compl', "{/literal}{'Evaluation of complexity: bad'|i18n('ocbootstrap')}{literal}"],
        '10': ['u-color-compl', "{/literal}{'Evaluation of complexity: very weak'|i18n('ocbootstrap')}{literal}"],
        '20': ['u-color-compl', "{/literal}{'Evaluation of complexity: weak'|i18n('ocbootstrap')}{literal}"],
        '30': ['u-color-compl', "{/literal}{'Evaluation of complexity: good'|i18n('ocbootstrap')}{literal}"],
        '40': ['u-color-compl', "{/literal}{'Evaluation of complexity: very good'|i18n('ocbootstrap')}{literal}"],
        '50': ['u-color-compl', "{/literal}{'Evaluation of complexity: excellent'|i18n('ocbootstrap')}{literal}"]
      }
    });
    $('[name="NewPasswordConfirm"]').password({
      strengthMeter:false,
      message: "{/literal}{'Show/hide password'|i18n('ocbootstrap')}{literal}"
    });
  });
</script>
{/literal}

