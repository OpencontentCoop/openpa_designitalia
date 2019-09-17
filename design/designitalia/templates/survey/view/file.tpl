<div class="Form-field">
	<label class="Form-label {section show=$question.mandatory}is-required{/section}">
		{$question.question_number}.
		{$question.text|wash('xhtml')} {section show=$question.mandatory}<strong class="required">*</strong>{/section}
	</label>

	<!-- {$question.answer} -->
	{if $question.text2|count|gt(0)}
		<div class="file-info">File:
			{if $question.text2|count|gt(0)}<span class="file-size">{$question.text2}</span> {/if}
			{if $question.num2|gt(0)}<span class="file-size">({$question.num2} bytes)</span> {/if}
		</div>
	{/if}
	{if $question.answer|count|gt(0)}
		<input type="hidden" name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_{$attribute_id}" value="{$question.answer|wash()}">
	{/if}
	<input type="file" class="Form-input" name="{$prefix_attribute}_ezsurvey_file_{$question.id}_{$attribute_id}">
</div>
