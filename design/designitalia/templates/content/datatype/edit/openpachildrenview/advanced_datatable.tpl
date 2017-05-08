<div class="Form-field {$view.identifier} u-background-white u-padding-all-xs">
    <label class="Form-label" for="{$attribute.id}-{$view.identifier}">
        {'Opzioni'|i18n( 'design/admin/content/edit_attribute' )} {$view.name|wash()}
    </label>
    <em class="attribute-description">{$view.edit_template_help}</em>
    <input class="Form-input"
           id="{$attribute.id}-{$view.identifier}"
           type="text"
           size="70"
           name="{$attribute_base}_openpachildrenview_extra_{$attribute.id}[{$view.identifier}]"
           value="{cond(is_set($extra_configs[$view.identifier]), $extra_configs[$view.identifier]|wash(), '')}" >
</div>
