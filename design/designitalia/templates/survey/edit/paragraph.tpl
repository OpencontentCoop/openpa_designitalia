<fieldset class="Form-fieldset">
  <legend class="Form-legend">{"Paragraph"|i18n( 'survey' )}</legend>

  <div class="Form-field">
    <label class="Form-label">{"Text of paragraph"|i18n( 'survey' )}:</label>
    <textarea class="Form-input" name="{$prefix_attribute}_ezsurvey_question_{$question.id}_text_{$attribute_id}" cols="70" rows="5" >{$question.text|wash('xhtml')}</textarea>
  </div>
</fieldset>