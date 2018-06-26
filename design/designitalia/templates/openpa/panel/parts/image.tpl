{if $node|has_attribute('image')}
  <div class="openpa-panel-image">
    <a href="{$openpa.content_link.full_link}" aria-hidden="true" tabindex="-1">
      <img src="{$node|attribute('image').content['agid_panel'].full_path|ezroot(no)}"
           alt="Immagine decorativa per il contenuto {$node.name|wash()}"
           class="u-sizeFull"
           role="presentation" />
    </a>
  </div>
{/if}
