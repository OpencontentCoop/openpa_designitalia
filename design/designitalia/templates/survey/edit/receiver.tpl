<fieldset class="Form-fieldset">
    <legend class="Form-legend">{"Receiver"|i18n( 'survey' )}</legend>

    <div class="Form-field">
        <label class="Form-label">{"Email Sender"|i18n( 'survey' )}</label>
       {def $email_sender_list=$question.email_sender_list}
       <select class="Form-input" name="{$prefix_attribute}_ezsurvey_question_{$question.id}_text3_{$attribute_id}">
          {foreach $email_sender_list as $id => $email}
          <option value="{$id|wash()}" {if and( $question.text3|explode('_')|count|gt(1), $question.text3|explode('_').0|eq($id|explode('_').0 ) )} selected="selected"{/if}>{$email|wash()}</option>
          {/foreach}
       </select>
        <div class="Prose Alert Alert--info u-margin-top-s" role="alert">
            <p>{"N. B. If you enter just one email address, user will not see this question. Instead the posting will be directly sent to the address."|i18n( 'survey' )}</p>
        </div>
    </div>
    
    
    <div class="Form-field">
        <label class="Form-label">{"Text of question"|i18n( 'survey' )}</label>
      <input class="Form-input" type="text" name="{$prefix_attribute}_ezsurvey_question_{$question.id}_text_{$attribute_id}" value="{$question.text|wash('xhtml')}" size="70" />
    </div>
    
    <table class="table table-condensed table-striped" cellspacing="0">
      <tr>
        <th class="tight">&nbsp;</th>
        <th>{"Name"|i18n( 'survey' )}</th>
        <th>{"Email"|i18n( 'survey' )}</th>
        <th class="tight">{"Presel."|i18n( 'survey' )}</th>
        <th class="tight">{"Order"|i18n( 'survey' )}</th>
      </tr>
      {def $is_selected=false()}
      {foreach $question.options as $option sequence array(bglight,bgdark) as $class}
      <tr class="{$class}">
        <td><input name="{$prefix_attribute}_ezsurvey_receiver_{$question.id}_{$option.id}_selected_{$attribute_id}" type="checkbox" /></td>
        <td><input class="Form-input" name="{$prefix_attribute}_ezsurvey_receiver_{$question.id}_{$option.id}_label_{$attribute_id}" type="text" value="{$option.label|wash('xhtml')}" size="30" /></td>
        <td><input class="Form-input" name="{$prefix_attribute}_ezsurvey_receiver_{$question.id}_{$option.id}_value_{$attribute_id}" type="text" value="{$option.value|wash('xhtml')}" size="20" /></td>
        <td><input name="{$prefix_attribute}_ezsurvey_receiver_{$question.id}_checked_{$attribute_id}" type="radio"{if $option.checked|eq(1)} checked="checked"{set $is_selected=true()}{/if} value="{$option.id}" /></td>
        <td><input class="Form-input" name="{$prefix_attribute}_ezsurvey_receiver_{$question.id}_{$option.id}_tab_order_{$attribute_id}" type="text" size="2" value="{$option.id|wash('xhtml')}" /></td>
      </tr>
      {/foreach}
    </table>
    
    <div class="Form-field">
      <input class="btn btn-info btn-sm" type="submit" name="CustomActionButton[{$attribute_id}_ezsurvey_receiver_{$question.id}_remove_selected]" value="{'Remove selected'|i18n( 'survey' )}" />
      <input class="btn btn-info btn-sm" type="submit" name="CustomActionButton[{$attribute_id}_ezsurvey_receiver_{$question.id}_new_option]" value="{'New option'|i18n( 'survey' )}" />
      <input class="btn btn-info btn-sm" type="submit" name="CustomActionButton[{$attribute_id}_ezsurvey_receiver_{$question.id}_uncheck_options]" value="{'Uncheck option'|i18n( 'survey' )}"{if $is_selected|eq(false())} disabled="disabled"{/if} />
    </div>
</fieldset>
