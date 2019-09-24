<div class="openpa-full-last-modified">
    <small>{'Published'|i18n('openpa_designitalia')}: {$node.object.published|l10n(date)}{if $node.object.modified|gt(sum($node.object.published,86400))} - {'Last modify'|i18n('openpa_designitalia')}: {$node.object.modified|l10n(date)}{/if}</small>
</div>
