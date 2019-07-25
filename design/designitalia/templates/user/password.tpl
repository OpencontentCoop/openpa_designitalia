{ezscript_require(array(
  "password-score/password-score.js",
  "password-score/password-score-options.js",
  "password-score/bootstrap-strength-meter.js",
  "password-score/password.js"
))}
{ezcss_require(array('password-score/password.css'))}

<div class='Grid u-padding-bottom-xxl'>
    <div class='Grid-cell u-md-size1of3 u-lg-size1of3 u-md-before1of3 u-lg-before1of3'>

        <form class="Form Form--spaced" autocomplete="off" action={concat($module.functions.password.uri,"/",$userID)|ezurl} method="post" name="Password">

            <h1 class="u-textCenter u-text-h2 u-padding-bottom-m">{"Change password for user"|i18n("design/ocbootstrap/user/password")} {$userAccount.login}</h1>

            {if $message}
                {if or( $oldPasswordNotValid, $newPasswordNotMatch, $newPasswordTooShort )}
                    {if $oldPasswordNotValid}
                        <div class="alert alert-warning">
                            <h2>{'Please retype your old password.'|i18n('design/ocbootstrap/user/password')}</h2>
                        </div>
                    {/if}
                    {if $newPasswordNotMatch}
                        <div class="alert alert-warning">
                            <h2>{"Password didn't match, please retype your new password."|i18n('design/ocbootstrap/user/password')}</h2>
                        </div>
                    {/if}
                    {if $newPasswordTooShort}
                        <div class="alert alert-warning">
                            <h2>{"The new password must be at least %1 characters long, please retype your new password."|i18n( 'design/ocbootstrap/user/password','',array( ezini('UserSettings','MinPasswordLength') ) )}</h2>
                        </div>
                    {/if}

                {else}
                    <div class="feedback">
                        <h2>{'Password successfully updated.'|i18n('design/ocbootstrap/user/password')}</h2>
                    </div>
                {/if}

            {/if}

            <div class="Form-field">
                <label class="Form-label">{"Old password"|i18n("design/ocbootstrap/user/password")} {if $oldPasswordNotValid}*{/if}</label>
                <input class="Form-input" type="password" name="oldPassword" size="11" value="{$oldPassword|wash}"/>
            </div>
            <div class="Form-field">
                <label class="Form-label">{"New password"|i18n("design/ocbootstrap/user/password")} {if $newPasswordNotMatch}*{/if}</label>
                <input id="pwd-input" class="Form-input" autocomplete="nope" type="password" name="newPassword" size="11"
                       value="{$newPassword|wash}"/>
                {include uri='design:parts/password_meter.tpl'}
            </div>
            <div class="Form-field">
                <label class="Form-label">{"Retype password"|i18n("design/ocbootstrap/user/password")} {if $newPasswordNotMatch}*{/if}</label>
                <input class="Form-input" autocomplete="off" type="password" name="confirmPassword" size="11"
                       value="{$confirmPassword|wash}"/>
            </div>

            <input class="defaultbutton" type="submit" name="OKButton"
                   value="{'OK'|i18n('design/ocbootstrap/user/password')}"/>
            <input class="button" type="submit" name="CancelButton"
                   value="{'Cancel'|i18n('design/ocbootstrap/user/password')}"/>

        </form>
    </div>
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
