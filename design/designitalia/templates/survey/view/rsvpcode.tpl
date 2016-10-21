<div class="Form-field">
    <label class="Form-label {section show=$question.mandatory}is-required{/section}">{$question.question_number}
        . {$question.text|wash('xhtml')} <strong class="required">*</strong></label>

    {switch match=$question.num2}
    {case match=1}
    {section show=$question_result}
    {if is_set($survey_validation.post_variables.variables[$question.id])}
        {def $previous_vars=$survey_validation.post_variables.variables[$question.id]}
    {/if}
        <input class="Form-input" name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_{$attribute_id}" type="text"
               size="{$question.num}"
               value="{if is_set($previous_vars.extra_answer)}{$previous_vars.extra_answer}{else}{$question_result.text|wash('xhtml')}{/if}"/>
    {section-else}
        <input class="Form-input" name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_{$attribute_id}" type="text"
               size="{$question.num}" value="{first_set( $#view_parameters.code, $question.answer )|wash('xhtml')}"/>
    {/section}
    {/case}
    {case}
    {section show=$question_result}
    {if is_set($survey_validation.post_variables.variables[$question.id])}
        {def $previous_vars=$survey_validation.post_variables.variables[$question.id]}
    {/if}
        <textarea class="Form-input" name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_{$attribute_id}"
                  rows="{$question.num2}"
                  cols="{$question.num}">{if is_set($previous_vars.answer)}{$previous_vars.extra_answer}{else}{$question_result.text|wash('xhtml')}{/if}</textarea>
    {section-else}
        <textarea class="Form-input" name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_{$attribute_id}"
                  rows="{$question.num2}"
                  cols="{$question.num}">{first_set( $#view_parameters.code, $question.answer )|wash('xhtml')}</textarea>
    {/section}
    {/case}
    {/switch}
</div>