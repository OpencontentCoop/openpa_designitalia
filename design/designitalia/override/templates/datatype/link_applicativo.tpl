{if $attribute.data_text}
<a class="Button Button--default u-text-r-xs u-color-black" href="{$attribute.content|wash( xhtml )}" target="_blank" title="apri il link in una pagina esterna (si lascerà il sito)">{$attribute.data_text|wash( xhtml )}</a>
{else}
<a class="Button Button--default u-text-r-xs u-color-black" href="{$attribute.content|wash( xhtml )}" target="_blank" title="apri il link in una pagina esterna (si lascerà il sito)">Accedi al servizio</a>
{/if}