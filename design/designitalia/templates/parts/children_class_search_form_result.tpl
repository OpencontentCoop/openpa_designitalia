<p class="navigation u-padding-bottom-l">
    {foreach $data.fields as $field}
        <a class="Button Button--info u-text-xxs" href={concat( $page_url, $field.remove_view_parameters )|ezurl()}>
            <i class="fa fa-close"></i> <strong>{$field.name}:</strong> {$field.value}
        </a>
    {/foreach}
    <a class="Button Button--danger u-text-xxs" href={$page_url|ezurl()}>Annulla ricerca</a>
</p>

{if $data.count}

    <div class="content-view-children">
        {foreach $data.contents as $child }
            {node_view_gui view=line content_node=$child}
        {/foreach}
    </div>

    {include name=navigator
             uri='design:navigator/google.tpl'
             page_uri=$page_url
             item_count=$data.count
             view_parameters=$view_parameters
             item_limit=$page_limit}
{else}
    <div class="warning">Nessun risultato</div>
{/if}
