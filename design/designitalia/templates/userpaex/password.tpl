{ezscript_require(array(
"password-score/password-score.js",
"password-score/password-score-options.js",
"password-score/bootstrap-strength-meter.js",
"password-score/password.js"
))}
{ezcss_require(array('password-score/password.css'))}

<div class="Prose u-padding-bottom-xxl">

  <form action={concat($module.functions.password.uri,"/",$userID)|ezurl} method="post" name="Password">

    <h1>Cambia la password</h1>

    {if $message}
      {if or($oldPasswordNotValid,$newPasswordNotMatch,$newPasswordNotValidate,$newPasswordMustDiffer)}
        {if $oldPasswordNotValid}
          <div class="warning">
            <p>Reinserisci la vecchia password</p>
          </div>
        {/if}
        {if $newPasswordNotMatch}
          <div class="warning">
            <p>Controlla le nuove password perché non corrispondono</p>
          </div>
        {/if}
        {if $newPasswordNotValidate}
          <div class="warning">
            <p>Password non valida</p>
          </div>
        {/if}
        {if $newPasswordMustDiffer}
          <div class="warning">
            <p>La nuova password deve essere diversa dalla vecchia</p>
          </div>
        {/if}
      {else}
        <div class="feedback">
          <p>{'Password successfully updated.'|i18n('mbpaex/userpaex')}</p>
        </div>
      {/if}
    {/if}

    <div class="u-padding-top-m">
      <label class="Form-label" for="oldPassword">Vecchia password</label>
      <input type="password" class="Form-input" name="oldPassword" size="11" value="{$oldPassword}"/>
    </div>

    <div class="u-padding-top-m">
      <label class="Form-label">Nuova password</label>
      <input id="pwd-input" type="password" class="Form-input" name="newPassword" size="11" value="{$newPassword}"/>
      {include uri='design:parts/password_meter.tpl'}
    </div>

    <div class="u-padding-top-m">
      <label class="Form-label">Ridigita la nuova password</label>
      <input type="password" class="Form-input" name="confirmPassword" size="11" value="{$confirmPassword}"/>
    </div>

    <div class="u-padding-top-m u-cf">
      <input class="button pull-left" type="submit" name="CancelButton" value="Annulla"/>
      <input class="defaultbutton pull-right" type="submit" name="OKButton" value="{'OK'|i18n('mbpaex/userpaex')}"/>
    </div>

  </form>

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
    $('[name="confirmPassword"]').password({
      strengthMeter:false,
      message: "{/literal}{'Show/hide password'|i18n('ocbootstrap')}{literal}"
    });
  });
</script>
{/literal}

