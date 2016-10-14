{def $enable_StateEditButton = false()}


{foreach $object.allowed_assign_state_list as $allowed_assign_state_info}
<div class="Form-field">
    <label for="SelectedStateIDList-{$allowed_assign_state_info.group.id}" class="Form-label">{$allowed_assign_state_info.group.current_translation.name|wash}</label>
    <select id="SelectedStateIDList-{$allowed_assign_state_info.group.id}" class="Form-input" name="SelectedStateIDList[]" {if $allowed_assign_state_info.states|count|eq(1)}disabled="disabled"{/if}>
        {if $allowed_assign_state_info.states}
            {set $enable_StateEditButton = true()}
        {/if}
        {foreach $allowed_assign_state_info.states as $state}
            <option value="{$state.id}" {if $object.state_id_array|contains($state.id)}selected="selected"{/if}>{$state.current_translation.name|wash}</option>
        {/foreach}
    </select>
</div>
{/foreach}

{if $enable_StateEditButton}
    <input type="submit" value="{'Set'|i18n( 'design/admin/node/view/full' )}" name="StateEditButton" class="button pull-right" />
{/if}
