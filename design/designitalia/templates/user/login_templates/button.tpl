<h1 class='u-textCenter u-text-h2 u-padding-bottom-m'>{ezini(concat('LoginTemplate_', $login_module_setting), 'Title', 'app.ini')}</h1>

{if ezini_hasvariable(concat('LoginTemplate_', $login_module_setting), 'Text', 'app.ini')}
    <p class="u-margin-bottom-l Prose u-textCenter">{ezini(concat('LoginTemplate_', $login_module_setting), 'Text', 'app.ini')|wash()}</p>
{/if}

<div class="u-textCenter">
    <a href="{ezini(concat('LoginTemplate_', $login_module_setting), 'LinkHref', 'app.ini')|ezurl(no)}" class="Button Button--info u-text-l">
      {ezini(concat('LoginTemplate_', $login_module_setting), 'LinkText', 'app.ini')}
    </a>
</div>
