<fieldset class="Form-fieldset">
  <legend class="Form-legend">{"Number entry"|i18n( 'survey' )}</legend>

  <div class="Form-field">
    <label class="Form-label">{"Text of question"|i18n( 'survey' )}</label>
    <input class="Form-input" type="text" name="{$prefix_attribute}_ezsurvey_question_{$question.id}_text_{$attribute_id}" value="{$question.text|wash('xhtml')}" size="70" />
  </div>

  <fieldset class="Form-field Form-field--choose Grid-cell">
    <legend class="Form-legend">{"Mandatory answer"|i18n('survey')}</legend>
    <input type="hidden" name="{$prefix_attribute}_ezsurvey_question_{$question.id}_mandatory_hidden_{$attribute_id}" value="1" />
    <label class="Form-label Form-label--block">
      <input type="checkbox" class="Form-input" name="{$prefix_attribute}_ezsurvey_question_{$question.id}_mandatory_{$attribute_id}" value="1" {section show=$question.mandatory}checked{/section} />
      <span class="Form-fieldIcon" role="presentation"></span> {"Mandatory answer"|i18n('survey')}
    </label>
  </fieldset>

  <fieldset class="Form-field Form-field--choose Grid-cell">
    <legend class="Form-legend">{"Integer values only"|i18n( 'survey' )}</legend>
    <input type="hidden" name="{$prefix_attribute}_ezsurvey_question_{$question.id}_num_hidden_{$attribute_id}" value="1" />
    <label class="Form-label Form-label--block">
      <input type="checkbox" class="Form-input" name="{$prefix_attribute}_ezsurvey_question_{$question.id}_num_{$attribute_id}" value="1"{section show=$question.num|eq(1)} checked="checked"{/section} />
      <span class="Form-fieldIcon" role="presentation"></span> {"Integer values only"|i18n( 'survey' )}
    </label>
  </fieldset>

  <div class="Form-field">
    <label class="Form-label">{"Minimum value"|i18n( 'survey' )}</label>
    <input class="Form-input" type="text" size="20" name="{$prefix_attribute}_ezsurvey_question_{$question.id}_text2_{$attribute_id}" value="{$question.text2|number($question.num)|wash('xhtml')}" />
  </div>

  <div class="Form-field">
    <label class="Form-label">{"Maximum value"|i18n( 'survey' )}</label>
    <input class="Form-input" type="text" size="20" name="{$prefix_attribute}_ezsurvey_question_{$question.id}_text3_{$attribute_id}" value="{$question.text3|number($question.num)|wash('xhtml')}" />
  </div>

  <div class="Form-field">
    <label class="Form-label">{"Default answer"|i18n( 'survey' )}</label><div class="labelbreak"></div>
    <input class="Form-input" type="text" size="20" name="{$prefix_attribute}_ezsurvey_question_{$question.id}_default_{$attribute_id}" value="{$question.default_value|number($question.num)|wash('xhtml')}" />
  </div>
</fieldset>