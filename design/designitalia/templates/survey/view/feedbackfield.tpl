{if $question.num2|eq(0)}
  <div class="Form-field">
	  <label class="Form-label {section show=$question.mandatory}is-required{/section}">
		  {$question.question_number}. {$question.text|wash('xhtml')} {section show=$question.mandatory}<strong class="required">*</strong>{/section}
	  </label>
  
	  {section show=$question_result}
		<input class="Form-input" name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_{$attribute_id}" type="text" size="20" value="{$question_result.text|wash('xhtml')}" />
	  {section-else}
		<input class="Form-input" name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_{$attribute_id}" type="text" size="20" value="{$question.answer|wash('xhtml')}" />
	  {/section}
  </div>
{else}
  <input name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_{$attribute_id}" type="hidden" value="{if $question_result}{$question_result.text|wash('xhtml')}{else}{$question.answer|wash('xhtml')}{/if}" />
{/if}