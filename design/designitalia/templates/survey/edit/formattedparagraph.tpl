<fieldset class="Form-fieldset">
    <legend class="Form-legend">{"Formatted Paragraph"|i18n( 'survey' )}</legend>

    <div class="Form-field">
        <label class="Form-label">{"Text of paragraph"|i18n( 'survey' )}</label>
        <textarea class="Form-input" name="SurveyQuestion_{$question.id}_Text" cols="70" rows="5">{$question.content|wash('xhtml')}</textarea>
    </div>

    <div class="Form-field">
        {$question.content}
    </div>
</fieldset>

{*

Code from eZXMLText content attribute

{$attribute.content.output.output_text}

{default input_handler=$attribute.content.input
         attribute_base='ContentObjectAttribute'}
  <textarea class="box" name="{$attribute_base}_data_text_{$attribute.id}" cols="97" rows="{$attribute.contentclass_attribute.data_int1}">{$input_handler.input_xml|wash(xhtml)}</textarea>
{/default}
*}
