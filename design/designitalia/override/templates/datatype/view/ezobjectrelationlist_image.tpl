{def $items = array()}
{foreach $attribute.content.relation_list as $item}
{if $item.in_trash|not()}
    {set $items = $items|append( fetch( content, object, hash( object_id, $item.contentobject_id ) ) )}
{/if}
{/foreach}
{if count( $items )|gt(0)}
  {include uri='design:atoms/slideshow.tpl' items=$items image_clas='agid_carousel'}
{/if}
{undef}