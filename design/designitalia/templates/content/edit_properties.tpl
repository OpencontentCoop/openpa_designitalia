<div class="Grid Grid--withGutter u-padding-bottom-s">
    <div class="Grid-cell u-sizeFull u-sm-size1of3 u-md-size1of3 u-lg-size1of3">
        <strong>{"Created"|i18n("design/standard/content/edit")}</strong>
    </div>
    <div class="Grid-cell u-sizeFull u-sm-size2of3 u-md-size2of3 u-lg-size2of3">
        {section show=$object.published}
        {$object.published|l10n(date)}
        {section-else}
            {"Not yet published"|i18n("design/standard/content/edit")}
        {/section}
    </div>
</div>

<div class="Grid Grid--withGutter u-padding-bottom-s">
    <div class="Grid-cell u-sizeFull u-sm-size1of3 u-md-size1of3 u-lg-size1of3">
        <strong>{"Last Modified"|i18n("design/standard/content/edit")}</strong>
    </div>
    <div class="Grid-cell u-sizeFull u-sm-size2of3 u-md-size2of3 u-lg-size2of3">
        {section show=$object.modified}
            {$object.modified|l10n(date)}
        {section-else}
            {"Not yet published"|i18n("design/standard/content/edit")}
        {/section}
    </div>
</div>
{*
<fieldset class="Form-field">
    <legend class="Form-label">{"Versions"|i18n("design/standard/content/edit")}</legend>
    <div class="Grid Grid--withGutter">
        <div class="Grid-cell u-sizeFull u-sm-size1of3 u-md-size1of3 u-lg-size1of3">
            <strong>{"Editing"|i18n("design/standard/content/edit")}</strong>
        </div>
        <div class="Grid-cell u-sizeFull u-sm-size2of3 u-md-size2of3 u-lg-size2of3">
            {$edit_version}
        </div>
    </div>
    <div class="Grid Grid--withGutter">
        <div class="Grid-cell u-sizeFull u-sm-size1of3 u-md-size1of3 u-lg-size1of3">
            <strong>{"Current"|i18n("design/standard/content/edit")}</strong>
        </div>
        <div class="Grid-cell u-sizeFull u-sm-size2of3 u-md-size2of3 u-lg-size2of3">
            {$object.current_version}
        </div>
    </div>
</fieldset>
*}
<fieldset class="Form-field">
    <legend class="Form-label">{"Sezioni"|i18n("design/standard/content/edit")}</legend>
    {include uri='design:content/parts/edit_sections.tpl'}
</fieldset>

<fieldset class="Form-field">
    <legend class="Form-label">{"States"|i18n("design/standard/content/edit")}</legend>
    {include uri='design:content/parts/edit_states.tpl'}
</fieldset>


<fieldset class="Form-field Form-field--choose Grid-cell">
    <legend class="Form-label">

        {foreach $translation_list as $index => $translation} {if eq( $edit_language, $translation.language_code )} {set $language_index = $index} {/if}{/foreach}

        {if $is_translating_content}
            {def $from_language_object = $object.languages[$from_language]}

            {'Translating content from %from_lang to %to_lang'|i18n( 'design/ezwebin/content/edit',, hash(
        '%from_lang', concat( $from_language_object.name, '&nbsp;<img src="', $from_language_object.locale|flag_icon, '" style="vertical-align: middle;" alt="', $from_language_object.locale, '" />' ),
        '%to_lang', concat( $translation_list[$language_index].locale.intl_language_name, '&nbsp;<img src="', $translation_list[$language_index].language_code|flag_icon, '" style="vertical-align: middle;" alt="', $translation_list[$language_index].language_code, '" />' )
        ) )}
        {else}
            {'Content in %language'|i18n( 'design/ezwebin/content/edit',, hash( '%language', $translation_list[$language_index].locale.intl_language_name ))}&nbsp;<img src="{$translation_list[$language_index].language_code|flag_icon}" style="vertical-align: middle;" alt="{$translation_list[$language_index].language_code}" />
        {/if}
    </legend>

    <label class="Form-label Form-label--block">
        <input type="radio"
               name="FromLanguage" value=""{if $from_language|not} checked="checked"{/if}{if $object.status|eq(0)} disabled="disabled"{/if}
               class="Form-input"> <span class="Form-fieldIcon" role="presentation"></span> {'No translation'|i18n( 'design/standard/content/edit' )}
    </label>

    {if $object.status}
        {foreach $object.languages as $language}
            <label class="Form-label Form-label--block">
                <input type="radio"
                       name="FromLanguage" value="{$language.locale}"{if $language.locale|eq($from_language)} checked="checked"{/if}
                       class="Form-input"> <span class="Form-fieldIcon" role="presentation"></span> {$language.name|wash}
            </label>
        {/foreach}
    {/if}

</fieldset>
<div class="pull-right">
    <input class="button" type="submit" name="FromLanguageButton" value="{'Translate'|i18n( 'design/standard/content/edit' )}" />
</div>

