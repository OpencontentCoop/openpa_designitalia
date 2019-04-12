{ezscript_require(array(
  "password-score/password-score.js",
  "password-score/password-score-options.js",
  "password-score/bootstrap-strength-meter.js"
))}
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
      <span id="pwd-text"></span>
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

<script type="text/javascript">
  $(document).ready(function() {ldelim}
    $('#pwd-input').strengthMeter('text', {ldelim}
      container: $('#pwd-text'),
      hierarchy: {ldelim}
        '0':  ['u-color-compl', 'Valutazione della complessità: pessima'],
        '10': ['u-color-compl', 'Valutazione della complessità: molto debole'],
        '20': ['u-color-compl', 'Valutazione della complessità: debole'],
        '30': ['u-color-compl', 'Valutazione della complessità: buona'],
        '40': ['u-color-compl', 'Valutazione della complessità: molto buona'],
        '50': ['u-color-compl', 'Valutazione della complessità: ottima']
        {rdelim}
      {rdelim});
    {rdelim});
</script>
