{def $settings=$handler.settings}
<fieldset class="Form-fieldset u-margin-top-m">
  <legend class="Form-legend">{$handler.name}</legend>

  <fieldset class="Form-field Form-field--choose Grid-cell u-margin-top-m">
    <label class="Form-label Form-label--block">
      <input type="checkbox" class="Form-input" name="ReceiveDigest_{$handler.id_string}" {$settings.receive_digest|choose( '', checked)} />
      <span class="Form-fieldIcon" role="presentation"></span> {'Receive all messages combined in one digest'|i18n( 'design/ocbootstrap/notification/handler/ezgeneraldigest/settings/edit' )}
    </label>
  </fieldset>

  <fieldset class="Form-field">
    <div class="Grid Grid--withGutter">
      <div class="Form-field Form-field--choose Grid-cell  u-md-size6of12 u-lg-size6of12">
        <label class="Form-label Form-label--block">
          <input type="radio" class="Form-input" name="DigestType_{$handler.id_string}" value="3" {eq($settings.digest_type,3)|choose('',checked)} />
          <span class="Form-fieldIcon" role="presentation"></span>{'Daily, at'|i18n( 'design/ocbootstrap/notification/handler/ezgeneraldigest/settings/edit' )}
        </label>
      </div>
      <div class="Form-field Grid-cell  u-md-size6of12 u-lg-size6of12">
        <select name="Time_{$handler.id_string}" class="Form-input">
        {foreach $handler.available_hours as $time}
          <option value="{$time}" {if eq( $time, $settings.time )}selected="selected"{/if}>{$time}</option>
        {/foreach}
        </select>
      </div>

      <div class="Form-field Form-field--choose Grid-cell  u-md-size6of12 u-lg-size6of12">
        <label class="Form-label Form-label--block">
          <input type="radio" class="Form-input" name="DigestType_{$handler.id_string}" value="1" {eq( $settings.digest_type, 1 )|choose( '', checked )} />
          <span class="Form-fieldIcon" role="presentation"></span>{'Once per week, on '|i18n( 'design/ocbootstrap/notification/handler/ezgeneraldigest/settings/edit' )}
        </label>
      </div>
      <div class="Form-field Grid-cell  u-md-size6of12 u-lg-size6of12">
        <select name="Weekday_{$handler.id_string}"  class="Form-input">
        {foreach $handler.all_week_days as $week_day}
          <option value="{$week_day}" {if eq( $week_day, $settings.day )}selected="selected"{/if}>{$week_day}</option>
        {/foreach}
        </select>
      </div>

      <div class="Form-field Grid-cell Form-field--choose u-md-size6of12 u-lg-size6of12">
        <label class="Form-label Form-label--block">
          <input type="radio" class="Form-input" name="DigestType_{$handler.id_string}" value="2" {eq( $settings.digest_type, 2)|choose( '', checked )} />
          <span class="Form-fieldIcon" role="presentation"></span>{'Once per month, on day number'|i18n( 'design/ocbootstrap/notification/handler/ezgeneraldigest/settings/edit' )}
        </label>
      </div>
      <div class="Form-field Grid-cell  u-md-size6of12 u-lg-size6of12">
        <select name="Monthday_{$handler.id_string}" class="Form-input">
        {foreach $handler.all_month_days as $month_day}
          <option value="{$month_day}" {if eq( $month_day, $settings.day )}selected="selected"{/if}>{$month_day}</option>
        {/foreach}
        </select>
      </div>
    </div>
    <div class="Alert Alert--info">
      <p>
        {'If day number is larger than the number of days within the current month, the last day of the current month will be used.'|i18n( 'design/ocbootstrap/notification/handler/ezgeneraldigest/settings/edit' )}
      </p>
    </div>
  </fieldset>
</fieldset>


