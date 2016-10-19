<fieldset class="Form-fieldset">
    <legend class="Form-legend">{"Feedback field entry"|i18n('survey')}</legend>

    <div class="Form-field">
        <label class="Form-label">{"Text of question"|i18n('survey')}:</label>
        <input class="Form-input" type="text"
               name="{$prefix_attribute}_ezsurvey_question_{$question.id}_text_{$attribute_id}"
               value="{$question.text|wash('xhtml')}" size="70"{if $question.num2|ne(0)} disabled="disabled"{/if} />
    </div>


    <fieldset class="Form-field Form-field--choose Grid-cell">
        <legend class="Form-legend">{"Mandatory answer"|i18n('survey')}</legend>
        <input type="hidden"
               name="{$prefix_attribute}_ezsurvey_question_{$question.id}_mandatory_hidden_{$attribute_id}" value="1"/>
        <label class="Form-label Form-label--block">
            <input type="checkbox" class="Form-input" name="{$prefix_attribute}_ezsurvey_question_{$question.id}_mandatory_{$attribute_id}"
                   value="1"{if $question.mandatory|eq(1)} checked="checked"{/if} />
            <span class="Form-fieldIcon" role="presentation"></span> {"Mandatory answer"|i18n('survey')}
        </label>
    </fieldset>

    <fieldset class="Form-field Form-field--choose Grid-cell">
        <legend class="Form-legend">{"Send copy in bcc to admin (%1)"|i18n('survey',,hash('%1', ezini('MailSettings', 'AdminEmail')))}</legend>
        <label class="Form-label Form-label--block">
            <input type="checkbox" class="Form-input" name="{$prefix_attribute}_ezsurvey_question_{$question.id}_num_{$attribute_id}"
                   value="1"{if $question.num|eq(1)} checked="checked"{/if} />
            <span class="Form-fieldIcon" role="presentation"></span> {"Send copy in bcc to admin (%1)"|i18n('survey',,hash('%1', ezini('MailSettings', 'AdminEmail')))}
        </label>
    </fieldset>

    {def $feedback_email_questions=$question.feedback_email_questions}
    <div class="Form-field">
        <label class="Form-label">{"Mapping"|i18n('survey')}</label>
        <select class="Form-input" name="{$prefix_attribute}_ezsurvey_question_{$question.id}_num2_{$attribute_id}">
            <option value="0"{if $question.num2|eq(0)} selected="selected"{/if}>{"None"|i18n('survey')}</option>
            {foreach $feedback_email_questions as $id => $feedback_question}
                <option value="{$id}"{if $question.num2|eq($id)} selected="selected"{/if}>{$feedback_question|wash(xhtml)}</option>
            {/foreach}
        </select>
    </div>


    <div class="Form-field">
        <label class="Form-label">{"Text of subject"|i18n('survey')}:</label>
        <input class="Form-input" type="text"
               name="{$prefix_attribute}_ezsurvey_question_{$question.id}_text3_{$attribute_id}"
               value="{$question.text3|wash('xhtml')}" size="70"/>
    </div>

    <div class="Form-field">
        <label class="Form-label">{"Feedback message for the receiver"|i18n('survey')}:</label>
        <textarea class="Form-input" name="{$prefix_attribute}_ezsurvey_question_{$question.id}_text2_{$attribute_id}"
                  rows="4">{$question.text2|wash('xhtml')}</textarea>
    </div>
</fieldset>
    