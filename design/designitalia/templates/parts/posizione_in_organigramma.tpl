{def $organigramma = organigramma($node.contentobject_id)}
{if $organigramma}
    <div class="openpa-widget posizione-organigramma">
        <h3 class="openpa-widget-title">{'Posizione nell'organigramma'|i18n('openpa/widget')}</h3>

        <ul class="org-chart">
            <li>
                {include level=0 uri='design:openpa/organigramma_item.tpl' item=$organigramma name=organigramma_item current_id=$node.contentobject_id}
            </li>
        </ul>

    </div>
{/if}
