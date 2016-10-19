<fieldset class="Form-fieldset">
    <legend class="Form-legend">{"Country"|i18n('survey')}</legend>


    <div class="Form-field">
        <label class="Form-label">{"Text of question"|i18n('survey')}:</label>
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
</fieldset>

