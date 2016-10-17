<div class="openpa-full-last-modified">
    <small>Pagina pubblicata {$node.object.published|l10n(date)}{if $node.object.modified|gt(sum($node.object.published,86400))} - Ultima modifica: {$node.object.modified|l10n(date)}{/if}</small>
</div>
