<fieldset class="Form-fieldset">
    <legend class="Form-legend">{"Related object entry"|i18n( 'survey' )}</legend>

    {if $question.num|gt(0)}
    {def $surveyobject=fetch('content','object', hash('object_id', $question.num))}
    {content_view_gui content_object=$surveyobject view='survey'}
        <div class="Form-field">
            <input class="btn btn-info btn-sm" type="submit" name="CustomActionButton[{$attribute_id}_ezsurvey_related_object_{$question.id}_remove]" value="{'Remove'}" />
            <input class="btn btn-info btn-sm" type="submit" name="CustomActionButton[{$attribute_id}_ezsurvey_related_object_{$question.id}_edit]" value="{'Edit'|i18n( 'survey' )}" />
            <input class="btn btn-info btn-sm" type="submit" name="CustomActionButton[{$attribute_id}_ezsurvey_related_object_{$question.id}_add_existing]" value="{'Add existing'}" />
            <input class="btn btn-info btn-sm" type="submit" name="CustomActionButton[{$attribute_id}_ezsurvey_related_object_{$question.id}_add_new]" value="{'Add new'|i18n( 'survey' )}" disabled="disabled" />
        </div>
    {else}
        <div class="Prose Alert Alert--info u-margin-top-s" role="alert">
            <p>{"Enter the button 'Add existing' or 'Add new' to create a new related object to the survey."|i18n( 'survey' )}</p>
        </div>
        <div class="Form-field">
            <input class="btn btn-info btn-sm" type="submit" name="CustomActionButton[{$attribute_id}_ezsurvey_related_object_{$question.id}_remove]" value="{'Remove'}" disabled="disabled" />
            <input class="btn btn-info btn-sm" type="submit" name="CustomActionButton[{$attribute_id}_ezsurvey_related_object_{$question.id}_edit]" value="{'Edit'|i18n( 'survey' )}" disabled="disabled" />
            <input class="btn btn-info btn-sm" type="submit" name="CustomActionButton[{$attribute_id}_ezsurvey_related_object_{$question.id}_add_existing]" value="{'Browse'|i18n( 'survey' )}" />
            <input class="btn btn-info btn-sm" type="submit" name="CustomActionButton[{$attribute_id}_ezsurvey_related_object_{$question.id}_add_new]" value="{'Add new'|i18n( 'survey' )}" />
        </div>
    {/if}
</fieldset>
