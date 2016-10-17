{def $zone_layout = cond( $attribute.content.zone_layout, $attribute.content.zone_layout, '' )
     $zones = $attribute.content.zones}

{if $zone_layout|ne( '' )}
    {def $template = ezini( $zone_layout, 'Template', 'zone.ini' )}
    <div class="openpa-widget-layout {$zone_layout}">
      {include uri=concat( 'design:zone/', $template ) zones=$zones zone_layout=$zone_layout attribute=$attribute}
    </div>
{/if}

