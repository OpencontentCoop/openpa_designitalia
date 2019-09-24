<div class="openpa-panel {$node|access_style}">

  {include uri='design:openpa/panel/parts/image.tpl'}

  <div class="openpa-panel-content">
    <h3 class="Card-title">
      <a class="Card-titleLink" href="{$openpa.content_link.full_link}"
         title="{$node.name|wash()}">{$node.name|wash()}</a>
    </h3>

    <div class="Card-text">
      {if $openpa.content_ruoli_comune.ruoli.dipendente}
        <ul class="list-unstyled">
          {foreach $openpa.content_ruoli_comune.ruoli.dipendente as $ruolo}
            <li><b>{node_view_gui content_node=$ruolo view=ruolo}</b></li>
          {/foreach}
        </ul>
      {/if}
    </div>
  </div>

  <a class="readmore" href="{object_handler($node).content_link.full_link}" title="{$node.name|wash()}">{'Read more'|i18n('openpa/widget')}</a>

</div>
