{def $image = false()}
{if $node|has_attribute( 'immagini' )}
  {set $image = fetch('content','node',hash('node_id',$node.data_map.immagini.content.relation_list[0].node_id))}  
{/if}

<div class="openpa-panel {$node|access_style}">
    {if $image}
      <div class="openpa-panel-image">
        <a href="{$openpa.content_link.full_link}" aria-hidden="true" tabindex="-1">
          <img src="{$image|attribute('image').content['agid_panel'].full_path|ezroot(no)}"
               alt="Immagine decorativa per il contenuto {$node.name|wash()}"
               class="u-sizeFull"
               role="presentation" />
        </a>
      </div>
    {/if}


    <div class="openpa-panel-content">
        <h3 class="Card-title">
            <a class="Card-titleLink" href="{$openpa.content_link.full_link}"
               title="{$node.name|wash()}">{$node.name|wash()}</a>
        </h3>

        <div class="Card-text">
            <p>{$node|abstract()|oc_shorten(150)}</p>
        </div>
    </div>

    <a class="readmore" href="{object_handler($node).content_link.full_link}" title="{$node.name|wash()}">Leggi</a>

</div>
{undef $image}