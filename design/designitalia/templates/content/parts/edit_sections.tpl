{def $sections=$object.allowed_assign_section_list
     $currentSectionName='unknown'}

{foreach $sections as $sectionItem }
    {if eq( $sectionItem.id, $object.section_id )}
        {set $currentSectionName=$sectionItem.name}
    {/if}
{/foreach}

{undef $currentSectionName}

<div class="Form-field">
    <label class="Form-label" for="SelectedSectionId">{'Choose section'|i18n( 'design/admin/node/view/full' )}:</label>
    <select id="SelectedSectionId" name="SelectedSectionId" class="Form-input">
    {foreach $sections as $section}
        {if eq( $section.id, $object.section_id )}
        <option value="{$section.id}" selected="selected">{$section.name|wash}</option>
        {else}
        <option value="{$section.id}">{$section.name|wash}</option>
        {/if}
    {/foreach}
    </select>
</div>

<input type="submit" value="{'Set'|i18n( 'design/admin/node/view/full' )}" name="SectionEditButton" class="button pull-right" />



