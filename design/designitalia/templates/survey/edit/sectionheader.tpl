<fieldset class="Form-fieldset">
  <legend class="Form-legend">{"Section header"|i18n( 'survey' )}</legend>

  <div class="Form-field">
    <label class="Form-label">{"Text of header"|i18n( 'survey' )}</label><div class="labelbreak"></div>
    <input class="Form-input" type="text" name="{$prefix_attribute}_ezsurvey_question_{$question.id}_text_{$attribute_id}" value="{$question.text|wash('xhtml')}" size="30" />
  </div>
</fieldset>
