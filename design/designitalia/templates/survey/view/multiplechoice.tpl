<div class="Form-field">
    <label class="Form-label {section show=$question.mandatory}is-required{/section}">{$question.question_number}
        . {$question.text|wash('xhtml')} {switch match=$question.num}{case match=1}
            <strong class="required">*</strong>
        {/case}{case match=2}<strong class="required">*</strong>{/case}{case}{/case}{/switch}</label>

    {def $attr_id=concat($prefix_attribute,'_ezsurvey_answer_id_',$question.id,'_', $attribute_id)}
    {def $attr_name=concat($prefix_attribute, '_ezsurvey_answer_' , $question.id, '_' , $attribute_id)}
    {def $attr_alternative=concat($prefix_attribute,'_ezsurvey_answer_alternative_',$question.id, '_', $attribute_id)}

    {if is_set($question.multiple_choice_answers.options)}
        {def $options=$question.multiple_choice_answers.options}
    {else}
        {def $options=$question.options}
    {/if}

    {section show=$question_result} {* Show survey persistent view *}
    {if is_set($survey_validation.post_variables.variables[$question.id])}
        {def $previous_vars=$survey_validation.post_variables.variables[$question.id]}
    {/if}

    {switch match=$question.num}

    {case match=1} {* Radio buttons in a row *}
        <fieldset class="Form-field Form-field--choose Grid-cell">
            {section var=option loop=$question.options}
                <label class="u-margin-rigth-s">
                    <input id="{$attr_id}_{$option.id}" name="{$attr_name}" type="radio" class="Form-input"
                           value="{$option.value}"{if is_set($previous_vars.answer)}{if $previous_vars.answer|eq($option.value)} checked="checked"{/if}{else}{if is_set( $question_result.content[$option.value] )} checked="checked"{/if}{/if}
                           onclick="synchFormElements( '{$attr_id}_{$option.id}', '{$attr_alternative}', false );"/>
                    <span class="Form-fieldIcon" role="presentation"></span> {$option.label}
                </label>
            {/section}
        </fieldset>
        {if $question.extra_info.enabled|eq(1)}
            <div class="Grid u-background-grey-10">
                <div class="Grid-cell u-sizeFull u-sm-size1of3 u-md-size1of3 u-lg-size1of3">
                    <fieldset class="Form-field Form-field--choose Grid-cell">
                        <label>
                            <input id="{$attr_id}" name="{$attr_name}" type="radio" class="Form-input"
                                   value="{$question.extra_info.value}"{if is_set($previous_vars.answer)}{if $previous_vars.answer|eq($question.extra_info.value)} checked="checked"{/if}{else}{if is_set( $question_result.content[$question.extra_info.value])} checked="checked"{/if}{/if}
                                   onclick="synchFormElements( '{$attr_id}', '{$attr_alternative}', true );"/>
                            <span class="Form-fieldIcon" role="presentation"></span> {$question.extra_info.label|wash(xhtml)}
                        </label>
                    </fieldset>
                </div>
                <div class="Grid-cell u-sizeFull u-sm-size2of3 u-md-size2of3 u-lg-size2of3">
                    {if $question.extra_info.row|eq(1)}
                        <div class="Form-field">
                            <input id="{$attr_alternative}" type="text"
                                   name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_extra_info_{$attribute_id}"
                                   value="{if is_set($previous_vars.extra_answer)}{$previous_vars.extra_answer}{else}{$question_result.extra_info.value}{/if}"{if $question.extra_info.enable_css_style|eq(1)} class="Form-input"{/if} />
                        </div>
                    {else}
                        <div class="Form-field">
                            <textarea id="{$attr_alternative}" type="text"
                                      name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_extra_info_{$attribute_id}"
                                      rows="{$question.extra_info.row}" cols="{$question.extra_info.column}"{if $question.extra_info.enable_css_style|eq(1)} class="Form-input"{/if}/>{if is_set($previous_vars.extra_answer)}{$previous_vars.extra_answer}{else}{$question_result.extra_info.value}{/if}</textarea>
                        </div>
                    {/if}
                </div>
            </div>
        {/if}
    {/case}

    {case match=2} {* Radio buttons in a column *}
        <fieldset class="Form-field Form-field--choose Grid-cell">
            {section var=option loop=$question.options}
                <label class="Form-label Form-label--block">
                    <input id="{$attr_id}_{$option.id}" name="{$attr_name}" type="radio" class="Form-input"
                           value="{$option.value}"{if is_set($previous_vars.answer)}{if $previous_vars.answer|eq($option.value)} checked="checked"{/if}{else}{if is_set( $question_result.content[$option.value] )} checked="checked"{/if}{/if}
                           onclick="synchFormElements( '{$attr_id}_{$option.id}', '{$attr_alternative}', false );"/>
                    <span class="Form-fieldIcon" role="presentation"></span> {$option.label}
                </label>
            {/section}
        </fieldset>
        {if $question.extra_info.enabled|eq(1)}
            <div class="Grid u-background-grey-10">
                <div class="Grid-cell u-sizeFull u-sm-size1of3 u-md-size1of3 u-lg-size1of3">
                    <fieldset class="Form-field Form-field--choose Grid-cell">
                        <label>
                            <input id="{$attr_id}" name="{$attr_name}" type="radio" class="Form-input"
                                   value="{$question.extra_info.value}"{if is_set($previous_vars.answer)}{if $previous_vars.answer|eq($question.extra_info.value)} checked="checked"{/if}{else}{if is_set( $question_result.content[$question.extra_info.value])} checked="checked"{/if}{/if}
                                   onclick="synchFormElements( '{$attr_id}', '{$attr_alternative}', true );"/>
                            <span class="Form-fieldIcon" role="presentation"></span> {$question.extra_info.label|wash(xhtml)}
                        </label>
                    </fieldset>
                </div>
                <div class="Grid-cell u-sizeFull u-sm-size2of3 u-md-size2of3 u-lg-size2of3">
                    {if $question.extra_info.row|eq(1)}
                        <div class="Form-field">
                            <input id="{$attr_alternative}" type="text"
                                   name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_extra_info_{$attribute_id}"
                                   value="{if is_set($previous_vars.extra_answer)}{$previous_vars.extra_answer}{else}{$question_result.extra_info.value}{/if}"{if $question.extra_info.enable_css_style|eq(1)} class="Form-input"{/if} />
                        </div>
                    {else}
                        <div class="Form-field">
                            <textarea id="{$attr_alternative}" type="text"
                                      name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_extra_info_{$attribute_id}"
                                      rows="{$question.extra_info.row}" cols="{$question.extra_info.column}"{if $question.extra_info.enable_css_style|eq(1)} class="Form-input"{/if}/>{if is_set($previous_vars.extra_answer)}{$previous_vars.extra_answer}{else}{$question_result.extra_info.value}{/if}</textarea>
                        </div>
                    {/if}
                </div>
            </div>
        {/if}
    {/case}

    {case match=3} {* check box in a row *}
        <fieldset class="Form-field Form-field--choose Grid-cell">
            {section var=option loop=$question.options}
                <label class="u-margin-rigth-s">
                    <input name="{$attr_name}[]" type="checkbox" class="Form-input"
                           value="{$option.value}"{if is_set($previous_vars.answer)}{if is_set($previous_vars.answer[$option.value])} checked="checked"{/if}{else}{if is_set( $question_result.content[$option.value] )} checked="checked"{/if}{/if} />
                    <span class="Form-fieldIcon" role="presentation"></span> {$option.label}
                </label>
            {/section}
        </fieldset>
        {if $question.extra_info.enabled|eq(1)}
            <div class="Grid u-background-grey-10">
                <div class="Grid-cell u-sizeFull u-sm-size1of3 u-md-size1of3 u-lg-size1of3">
                    <fieldset class="Form-field Form-field--choose Grid-cell">
                        <label>
                            <input id="{$attr_id}" name="{$attr_name}[]" type="checkbox"
                                   value="{$question.extra_info.value}"{if is_set($previous_vars.answer)}{if is_set($previous_vars.answer[$question.extra_info.value])} checked="checked"{/if}{else}{if is_set( $question_result.content[$question.extra_info.value])} checked="checked"{/if}{/if}
                                   onclick="synchFormElements( '{$attr_id}', '{$attr_alternative}', true );"/>
                            <span class="Form-fieldIcon" role="presentation"></span> {$question.extra_info.label|wash(xhtml)}
                        </label>
                    </fieldset>
                </div>
                <div class="Grid-cell u-sizeFull u-sm-size2of3 u-md-size2of3 u-lg-size2of3">
                    <div class="Form-field">
                        {if $question.extra_info.row|eq(1)}
                            <input id="{$attr_alternative}" type="text"
                                   name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_extra_info_{$attribute_id}"
                                   value="{if is_set($previous_vars.extra_answer)}{$previous_vars.extra_answer}{else}{$question_result.extra_info.value}{/if}"{if $question.extra_info.enable_css_style|eq(1)} class="Form-input"{/if} />
                        {else}
                            <textarea id="{$attr_alternative}" type="text"
                                      name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_extra_info_{$attribute_id}"
                                      rows="{$question.extra_info.row}" cols="{$question.extra_info.column}"{if $question.extra_info.enable_css_style|eq(1)} class="Form-input"{/if}/>{if is_set($previous_vars.extra_answer)}{$previous_vars.extra_answer}{else}{$question_result.extra_info.value}{/if}</textarea>
                        {/if}
                    </div>
                </div>
            </div>
        {/if}
    {/case}

    {case match=4} {* check box in a column *}
        <fieldset class="Form-field Form-field--choose Grid-cell">
            {section var=option loop=$question.options}
                <label class="Form-label Form-label--block">
                    <input name="{$attr_name}[]" type="checkbox" class="Form-input"
                           value="{$option.value}"{if is_set($previous_vars.answer)}{if is_set($previous_vars.answer[$option.value])} checked="checked"{/if}{else}{if is_set( $question_result.content[$option.value] )} checked="checked"{/if}{/if} />
                    <span class="Form-fieldIcon" role="presentation"></span> {$option.label}
                </label>
            {/section}
        </fieldset>
        {if $question.extra_info.enabled|eq(1)}
            <div class="Grid u-background-grey-10">
                <div class="Grid-cell u-sizeFull u-sm-size1of3 u-md-size1of3 u-lg-size1of3">
                    <fieldset class="Form-field Form-field--choose Grid-cell">
                        <label>
                            <input id="{$attr_id}" name="{$attr_name}[]" type="checkbox"
                                   value="{$question.extra_info.value}"{if is_set($previous_vars.answer)}{if is_set($previous_vars.answer[$question.extra_info.value])} checked="checked"{/if}{else}{if is_set( $question_result.content[$question.extra_info.value])} checked="checked"{/if}{/if}
                                   onclick="synchFormElements( '{$attr_id}', '{$attr_alternative}', true );"/>
                            <span class="Form-fieldIcon" role="presentation"></span> {$question.extra_info.label|wash(xhtml)}
                        </label>
                    </fieldset>
                </div>
                <div class="Grid-cell u-sizeFull u-sm-size2of3 u-md-size2of3 u-lg-size2of3">
                    <div class="Form-field">
                        {if $question.extra_info.row|eq(1)}
                            <input id="{$attr_alternative}" type="text"
                                   name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_extra_info_{$attribute_id}"
                                   value="{if is_set($previous_vars.extra_answer)}{$previous_vars.extra_answer}{else}{$question_result.extra_info.value}{/if}"{if $question.extra_info.enable_css_style|eq(1)} class="Form-input"{/if} />
                        {else}
                            <textarea id="{$attr_alternative}" type="text"
                                      name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_extra_info_{$attribute_id}"
                                      rows="{$question.extra_info.row}" cols="{$question.extra_info.column}"{if $question.extra_info.enable_css_style|eq(1)} class="Form-input"{/if}/>{if is_set($previous_vars.extra_answer)}{$previous_vars.extra_answer}{else}{$question_result.extra_info.value}{/if}</textarea>
                        {/if}
                    </div>
                </div>
            </div>
        {/if}
    {/case}

    {case match=5} {* select box *}
        <div class="Form-field">
            <select class="Form-input" name="{$attr_name}"
                    onclick="synchFormElements( '{$attr_id}', '{$attr_alternative}', true );">
                {section var=option loop=$question.options}
                    <option value="{$option.value}"{if is_set($previous_vars.answer)}{if $previous_vars.answer|eq($option.value)} selected="selected"{/if}{else}{if is_set( $question_result.content[$option.value] )} selected="selected"{/if}{/if}>{$option.label}</option>
                {/section}
                {if $question.extra_info.enabled|eq(1)}
                    <option id="{$attr_id}"
                            value="{$question.extra_info.value|wash(xhtml)}"{if is_set($previous_vars.answer)}{if $previous_vars.answer|eq($question.extra_info.value)} selected="selected"{/if}{else}{if is_set( $question_result.content[$question.extra_info.value] )} selected="selected"{/if}{/if}>{$question.extra_info.label|wash(xhtml)}</option>
                {/if}
            </select>
        </div>
    {if $question.extra_info.row|eq(1)}
        <div class="Form-field">
            <input class="Form-input" id="{$attr_alternative}" type="text"
                   name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_extra_info_{$attribute_id}"
                   value="{if is_set($previous_vars.extra_answer)}{$previous_vars.extra_answer}{else}{$question_result.extra_info.value}{/if}"{if $question.extra_info.enable_css_style|eq(1)} class="Form-input"{/if} />
        </div>
    {else}
        <div class="Form-field">
            <textarea class="Form-input" id="{$attr_alternative}" type="text"
                      name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_extra_info_{$attribute_id}"
                      rows="{$question.extra_info.row}" cols="{$question.extra_info.column}"{if $question.extra_info.enable_css_style|eq(1)} class="Form-input"{/if}/>{if is_set($previous_vars.extra_answer)}{$previous_vars.extra_answer}{else}{$question_result.extra_info.value}{/if}</textarea>
        </div>
    {/if}
</div>
{/case}

{case}{/case}
{/switch}

{if $question.extra_info.enabled|eq(1)} {* Extra info block*}

{/if}

{section-else}

    {switch match=$question.num}

    {case match=1} {* Radio buttons in a row *}
        <fieldset class="Form-field Form-field--choose Grid-cell">
            {section var=option loop=$options}
                <label class="u-margin-rigth-s">
                    <input id="{$attr_id}_{$option.id}" name="{$attr_name}" type="radio" class="Form-input"
                           value="{$option.value}"{section show=$option.toggled|eq(1)} checked="checked"{/section}
                           onclick="synchFormElements( '{$attr_id}_{$option.id}', '{$attr_alternative}', false );"/>
                    <span class="Form-fieldIcon" role="presentation"></span> {$option.label}
                </label>
            {/section}
        </fieldset>
        {if $question.extra_info.enabled|eq(1)}
            <div class="Grid u-background-grey-10">
                <div class="Grid-cell u-sizeFull u-sm-size1of3 u-md-size1of3 u-lg-size1of3">
                    <fieldset class="Form-field Form-field--choose Grid-cell">
                        <label>
                            <input id="{$attr_id}" name="{$attr_name}" type="radio" class="Form-input"
                                   value="{$question.extra_info.value|wash(xhtml)}"{section show=$question.extra_info.value_checked|eq(1)} checked="checked"{/section}
                                   onclick="synchFormElements( '{$attr_id}', '{$attr_alternative}', true );"/>
                            <span class="Form-fieldIcon" role="presentation"></span> {$question.extra_info.label|wash(xhtml)}
                        </label>
                    </fieldset>
                </div>
                <div class="Grid-cell u-sizeFull u-sm-size2of3 u-md-size2of3 u-lg-size2of3">
                    <div class="Form-field">
                        {if $question.extra_info.row|eq(1)}

                            <input id="{$attr_alternative}" type="text"
                                   name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_extra_info_{$attribute_id}"
                                   value="{if is_set($question.extra_info.extra_answer)}{$question.extra_info.extra_answer}{else}{$question.extra_info.default_value}{/if}"{if $question.extra_info.enable_css_style|eq(1)} class="Form-input"{/if} />
                        {else}
                            <textarea id="{$attr_alternative}" type="text"
                                      name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_extra_info_{$attribute_id}"
                                      rows="{$question.extra_info.row}" cols="{$question.extra_info.column}"{if $question.extra_info.enable_css_style|eq(1)} class="Form-input"{/if}/>{if is_set($question.extra_info.extra_answer)}{$question.extra_info.extra_answer}{else}{$question.extra_info.default_value}{/if}</textarea>
                        {/if}
                    </div>
                </div>
            </div>
        {/if}
    {/case}

    {case match=2} {* Radio buttons in a column *}
    <fieldset class="Form-field Form-field--choose Grid-cell">
        {section var=option loop=$options}
            <label class="Form-label Form-label--block">
                <input id="{$attr_id}_{$option.id}" name="{$attr_name}" type="radio" class="Form-input"
                       value="{$option.value}"{section show=$option.toggled|eq(1)} checked="checked"{/section}
                       onclick="synchFormElements( '{$attr_id}_{$option.id}', '{$attr_alternative}', false );"/>
                <span class="Form-fieldIcon" role="presentation"></span> {$option.label}
            </label>
        {/section}
    </fieldset>
    {if $question.extra_info.enabled|eq(1)}
        <div class="Grid u-background-grey-10">
            <div class="Grid-cell u-sizeFull u-sm-size1of3 u-md-size1of3 u-lg-size1of3">
                <fieldset class="Form-field Form-field--choose Grid-cell">
                    <label>
                        <input id="{$attr_id}" name="{$attr_name}" type="radio" class="Form-input"
                               value="{$question.extra_info.value|wash(xhtml)}"{section show=$question.extra_info.value_checked|eq(1)} checked="checked"{/section}
                               onclick="synchFormElements( '{$attr_id}', '{$attr_alternative}', true );"/>
                        <span class="Form-fieldIcon" role="presentation"></span> {$question.extra_info.label|wash(xhtml)}
                    </label>
                </fieldset>
            </div>
            <div class="Grid-cell u-sizeFull u-sm-size2of3 u-md-size2of3 u-lg-size2of3">
                {if $question.extra_info.row|eq(1)}
                    <div class="Form-field">
                        <input id="{$attr_alternative}" type="text"
                               name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_extra_info_{$attribute_id}"
                               value="{if is_set($question.extra_info.extra_answer)}{$question.extra_info.extra_answer}{else}{$question.extra_info.default_value}{/if}"{if $question.extra_info.enable_css_style|eq(1)} class="Form-input"{/if} />
                    </div>
                {else}
                    <div class="Form-field">
                        <textarea id="{$attr_alternative}" type="text"
                                  name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_extra_info_{$attribute_id}"
                                  rows="{$question.extra_info.row}" cols="{$question.extra_info.column}"{if $question.extra_info.enable_css_style|eq(1)} class="Form-input"{/if}/>{if is_set($question.extra_info.extra_answer)}{$question.extra_info.extra_answer}{else}{$question.extra_info.default_value}{/if}</textarea>
                    </div>
                {/if}
            </div>
        </div>
    {/if}
    {/case}

    {case match=3} {* Checkbox in a row *}
        <fieldset class="Form-field Form-field--choose Grid-cell">
            {section var=option loop=$options}
                <label class="u-margin-rigth-s">
                    <input name="{$attr_name}[]" type="checkbox" class="Form-input"
                           value="{$option.value}"{section show=$option.toggled|eq(1)} checked="checked"{/section} />
                    <span class="Form-fieldIcon" role="presentation"></span> {$option.label}
                </label>
            {/section}
        </fieldset>
        {if $question.extra_info.enabled|eq(1)}
            <div class="Grid u-background-grey-10">
                <div class="Grid-cell u-sizeFull u-sm-size1of3 u-md-size1of3 u-lg-size1of3">
                    <fieldset class="Form-field Form-field--choose Grid-cell">
                        <label>
                            <input id="{$attr_id}" name="{$attr_name}[]" type="checkbox" class="Form-input"
                                   value="{$question.extra_info.value|wash(xhtml)}"{section show=$question.extra_info.value_checked|eq(1)} checked="checked"{/section}
                                   onclick="synchFormElements( '{$attr_id}', '{$attr_alternative}', true );"/>
                            <span class="Form-fieldIcon" role="presentation"></span> {$question.extra_info.label|wash(xhtml)}
                        </label>
                    </fieldset>
                </div>
                <div class="Grid-cell u-sizeFull u-sm-size2of3 u-md-size2of3 u-lg-size2of3">
                    {if $question.extra_info.row|eq(1)}
                        <div class="Form-field">
                            <input id="{$attr_alternative}" type="text"
                                   name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_extra_info_{$attribute_id}"
                                   value="{if is_set($question.extra_info.extra_answer)}{$question.extra_info.extra_answer}{else}{$question.extra_info.default_value}{/if}"{if $question.extra_info.enable_css_style|eq(1)} class="Form-input"{/if} />
                        </div>
                    {else}
                        <div class="Form-field">
                            <textarea id="{$attr_alternative}" type="text"
                                      name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_extra_info_{$attribute_id}"
                                      rows="{$question.extra_info.row}" cols="{$question.extra_info.column}"{if $question.extra_info.enable_css_style|eq(1)} class="Form-input"{/if}/>{if is_set($question.extra_info.extra_answer)}{$question.extra_info.extra_answer}{else}{$question.extra_info.default_value}{/if}</textarea>
                        </div>
                    {/if}
                </div>
            </div>
        {/if}
    {/case}

    {case match=4} {* Checkbox in a column *}
        <fieldset class="Form-field Form-field--choose Grid-cell">
            {section var=option loop=$options}
                <label class="Form-label Form-label--block">
                    <input name="{$attr_name}[]" type="checkbox" class="Form-input"
                           value="{$option.value}"{section show=$option.toggled|eq(1)} checked="checked"{/section} />
                    <span class="Form-fieldIcon" role="presentation"></span> {$option.label}
                </label>
            {/section}
        </fieldset>
        {if $question.extra_info.enabled|eq(1)}
            <div class="Grid u-background-grey-10">
                <div class="Grid-cell u-sizeFull u-sm-size1of3 u-md-size1of3 u-lg-size1of3">
                    <fieldset class="Form-field Form-field--choose Grid-cell">
                        <label>
                            <input id="{$attr_id}" name="{$attr_name}[]" type="checkbox" class="Form-input"
                                   value="{$question.extra_info.value|wash(xhtml)}"{section show=$question.extra_info.value_checked|eq(1)} checked="checked"{/section}
                                   onclick="synchFormElements( '{$attr_id}', '{$attr_alternative}', true );"/>
                            <span class="Form-fieldIcon" role="presentation"></span> {$question.extra_info.label|wash(xhtml)}
                        </label>
                    </fieldset>
                </div>
                <div class="Grid-cell u-sizeFull u-sm-size2of3 u-md-size2of3 u-lg-size2of3">
                    {if $question.extra_info.row|eq(1)}
                        <div class="Form-field">
                            <input id="{$attr_alternative}" type="text"
                                   name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_extra_info_{$attribute_id}"
                                   value="{if is_set($question.extra_info.extra_answer)}{$question.extra_info.extra_answer}{else}{$question.extra_info.default_value}{/if}"{if $question.extra_info.enable_css_style|eq(1)} class="Form-input"{/if} />
                        </div>
                    {else}
                        <div class="Form-field">
                            <textarea id="{$attr_alternative}" type="text"
                                      name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_extra_info_{$attribute_id}"
                                      rows="{$question.extra_info.row}" cols="{$question.extra_info.column}"{if $question.extra_info.enable_css_style|eq(1)} class="Form-input"{/if}/>{if is_set($question.extra_info.extra_answer)}{$question.extra_info.extra_answer}{else}{$question.extra_info.default_value}{/if}</textarea>
                        </div>
                    {/if}
                </div>
            </div>
        {/if}
    {/case}

    {case match=5} {* Select box *}
        <div class="Form-field">
            <select class="Form-input" name="{$attr_name}"
                    onclick="synchFormElements( '{$attr_id}', '{$attr_alternative}', true );">
                {section var=option loop=$options}
                    <option value="{$option.value}"{section show=$option.toggled|eq(1)} selected="selected"{/section}>{$option.label}</option>
                {/section}
                {if $question.extra_info.enabled|eq(1)}
                    <option id="{$attr_id}"
                            value="{$question.extra_info.value|wash(xhtml)}"{section show=$question.extra_info.value_checked|eq(1)} selected="selected"{/section}>{$question.extra_info.label|wash(xhtml)}</option>
                {/if}
            </select>
        </div>
    {if $question.extra_info.row|eq(1)}
        <div class="Form-field">
            <input class="Form-input" id="{$attr_alternative}" type="text"
                   name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_extra_info_{$attribute_id}"
                   value="{if is_set($question.extra_info.extra_answer)}{$question.extra_info.extra_answer}{else}{$question.extra_info.default_value}{/if}"{if $question.extra_info.enable_css_style|eq(1)} class="Form-input"{/if} />
        </div>
    {else}
        <div class="Form-field">
            <textarea class="Form-input" id="{$attr_alternative}" type="text"
                      name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_extra_info_{$attribute_id}"
                      rows="{$question.extra_info.row}"
                      cols="{$question.extra_info.column}"{if $question.extra_info.enable_css_style|eq(1)} class="Form-input"{/if}/>{if is_set($question.extra_info.extra_answer)}{$question.extra_info.extra_answer}{else}{$question.extra_info.default_value}{/if}</textarea>
        </div>
    {/if}
    {/case}

    {case}{/case}
    {/switch}

{/section}


<script type="text/javascript">
    <!--
    {literal}
    function synchFormElements() {
        var synchElement = document.getElementById(synchFormElements.arguments[0]);
        if (synchElement != undefined && synchElement != null) {
            var tag = synchElement.tagName.toLowerCase();
            var synchPolarity = synchFormElements.arguments[arguments.length - 1];
            var inputArray = new Array();

            for (var x = 0; x < ( synchFormElements.arguments.length - 2 ); x++) {
                inputArray[x] = synchFormElements.arguments[x + 1];
            }

            if (( tag == 'input' && ( ( synchElement.checked && synchPolarity ) || ( !synchElement.checked && !synchPolarity ) ) ) || ( tag == 'option' && ( ( synchElement.selected && synchPolarity ) || ( !synchElement.selected && !synchPolarity ) ) )) {
                setFormElements(inputArray, true);
            }
            else {
                setFormElements(inputArray, false);
            }
        }
    }

    function setFormElements(inputArray, enabled) {
        var modeString = '';

        if (!enabled) {
            modeString = 'disabled';
        }

        for (var x = 0; x < inputArray.length; x++) {
            var inputElement = document.getElementById(inputArray[x]);
            if (inputElement != undefined && inputElement != null) {
                inputElement.disabled = modeString;
                if (modeString == 'disabled') {
                    setClass(inputElement, 'disabled');
                }
                else {
                    removeClass(inputElement, 'disabled');
                }
            }
        }
    }

    function readClassArray(element) {
        if (typeof( element ) == 'string') {
            element = document.getElementById(element);
        }

        var classString = element.className;
        var classArray = classString.split(' ');
        return classArray;
    }

    function writeClassArray(element, classArray) {
        if (typeof( element ) == 'string') {
            element = document.getElementById(element);
        }

        var classString = classArray.join(' ');
        element.className = classString;
    }

    function setClass(element, className) {
        if (!checkClass(element, className)) {
            var classArray = readClassArray(element);
            classArray[classArray.length] = className;
            writeClassArray(element, classArray);
        }
    }

    function checkClass(element, className) {
        var classArray = readClassArray(element);

        for (x = 0; x < classArray.length; x++) {
            if (classArray[x] == className) {
                return true;
            }
        }

        return false;
    }

    function removeClass(element, className) {
        var classArray = readClassArray(element);

        for (x = 0; x < classArray.length; x++) {
            if (classArray[x] == className) {
                classArray[x] = '';
            }
        }

        writeClassArray(element, classArray);
    }
    {/literal}

    synchFormElements('{$attr_id}', '{$attr_alternative}', true);
    // -->
</script>
</div>