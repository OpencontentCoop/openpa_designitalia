{if is_set($module_result.content_info.persistent_variable.has_container)|not()}
    <div class="u-text-r-xl u-layout-r-withGutter u-padding-r-top">
{/if}
    {$module_result.content}
{if is_set($module_result.content_info.persistent_variable.has_container)|not()}
    </div>
{/if}

