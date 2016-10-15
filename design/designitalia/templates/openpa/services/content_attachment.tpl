{if $openpa.content_attachment.has_content}
    <div class="Grid Grid--withGutter">
        {foreach $openpa.content_attachment.attributes as $attribute}
            <div class="Grid-cell u-size3of12">
                <strong>{$attribute.contentclass_attribute_name|wash()}</strong>
            </div>
            <div class="Grid-cell u-size9of12">
                {attribute_view_gui attribute=$attribute}
            </div>
        {/foreach}
    </div>
{/if}

{if $openpa.content_attachment.children_count}
    <ol class="Prose Bullets">
        {foreach $openpa.content_attachment.children as $item}
            <li class="u-margin-bottom-s">
                <p class="Prose u-layout-prose">
                    {if $item|has_attribute( 'file' )}
                        <a class="u-textClean u-text-r-m"
                           href="{concat("content/download/",$item|attribute( 'file' ).contentobject_id,"/",$item|attribute( 'file' ).id,"/file/",$item|attribute( 'file' ).content.original_filename)|ezurl(no)}"
                           title="Scarica il file {$item|attribute( 'file' ).content.original_filename|wash( xhtml )}">
                            <i class="fa fa-download fa-2x"></i>
                            {$item.name|wash()}
                            <small>File {$item|attribute( 'file' ).content.original_filename}
                                ({$item|attribute( 'file' ).content.filesize|si( byte )})
                            </small>
                        </a>
                    {else}
                        <a class="u-textClean u-text-r-m" href="{$item.url_alias|ezurl(no)}">{$item.name|wash()}</a>
                    {/if}
                    {$item|abstract()}
                    {include uri="design:parts/toolbar/node_edit.tpl" current_node=$item}
                    {include uri="design:parts/toolbar/node_trash.tpl" current_node=$item}
                </p>
            </li>
        {/foreach}
    </ol>
{/if}
