{if ezini_hasvariable('LoginTemplate', 'Layout', 'app.ini')}
  {def $login_layout = ezini('LoginTemplate', 'Layout', 'app.ini')}
{else}
{def $login_layout = 'column'}
{/if}
{if ezini_hasvariable('LoginTemplate', 'LoginModules', 'app.ini')}
  {def $login_modules = ezini('LoginTemplate', 'LoginModules', 'app.ini')}
{else}
  {def $login_modules = array('default')}
{/if}
{def $login_modules_count = count($login_modules)}

{if $login_layout|eq('column')}
  <div class='Grid Grid--withGutter u-padding-bottom-xxl'>
    <div class='Grid-cell u-md-size1of2 u-lg-size1of2 u-md-before1of4 u-lg-before1of4'>
      {foreach $login_modules as $login_module}
        {def $login_module_parts = $login_module|explode('|')}
        <div class="u-margin-bottom-m">
          {include uri=concat('design:user/login_templates/', $login_module_parts[0], '.tpl') login_module_setting=cond(is_set($login_module_parts[1]), $login_module_parts[1], $login_module_parts[0])}
        </div>
        {undef $login_module_parts}
      {/foreach}
    </div>
  </div>
{elseif $login_layout|eq('row')}
  <div class='Grid Grid--withGutter u-padding-bottom-xxl'>
    {foreach $login_modules as $login_module}
      {def $login_module_parts = $login_module|explode('|')}
      <div class='Grid-cell u-md-size1of{$login_modules_count} u-lg-size1of{$login_modules_count}'>
        {include uri=concat('design:user/login_templates/', $login_module_parts[0], '.tpl') login_module_setting=cond(is_set($login_module_parts[1]), $login_module_parts[1], $login_module_parts[0])}
      </div>
      {undef $login_module_parts}
    {/foreach}
  </div>
{/if}

