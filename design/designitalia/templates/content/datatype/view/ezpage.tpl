{def $zone_layout = cond( $attribute.content.zone_layout, $attribute.content.zone_layout, '' )
     $zones = $attribute.content.zones}

{if $zone_layout|ne( '' )}
    {def $template = ezini( $zone_layout, 'Template', 'zone.ini' )}
    {if $zone_layout|ne('1ZonesLayoutFolder')}<div class="openpa-widget-layout {$zone_layout}">{/if}
      {include uri=concat( 'design:zone/', $template ) zones=$zones zone_layout=$zone_layout attribute=$attribute}
    {if $zone_layout|ne('1ZonesLayoutFolder')}</div>{/if}
{/if}

