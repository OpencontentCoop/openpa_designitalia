<article class="openpa-panel {$node|access_style} Card Card--withBorder u-color-grey-30">

  {include uri='design:openpa/panel/parts/image.tpl'}

  <div class="Card-content u-padding-r-all">
    <p class="Card-title">
      <a class="Card-titleLink" href="{$openpa.content_link.full_link}"
         title="{$node.name|wash()}">{$node.name|wash()}</a>
    </p>

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

  <a class="readmore" href="{object_handler($node).content_link.full_link}" title="{$node.name|wash()}">Leggi</a>

</article>
