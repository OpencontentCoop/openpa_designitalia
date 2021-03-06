{set_defaults( hash('is_program',false(), 'show_image', false()))}
{if is_set( $event.from )}
    {def $from = $event.from
    $to = $event.to
    $day = $event.from|datetime( 'custom', '%j' )
    $month = $event.from|datetime( 'custom', '%M' )
    $year = $event.from|datetime( 'custom', '%Y' )
    $time = $event.from|datetime( 'custom', '%T' )
    $sameDay = cond($event.to|sub($event.from)|le(86400), true(), false())}
{else}
    {def $from = $node.data_map.from_time.content.timestamp
    $to = $node.data_map.to_time.content.timestamp
    $day = $node.data_map.from_time.content.timestamp|datetime( 'custom', '%j' )
    $month = $node.data_map.from_time.content.timestamp|datetime( 'custom', '%M' )
    $year = $node.data_map.from_time.content.timestamp|datetime( 'custom', '%Y' )
    $time = $node.data_map.from_time.content.timestamp|datetime( 'custom', '%T' )
    $sameDay = cond($node.data_map.to_time.content.timestamp|sub($node.data_map.from_time.content.timestamp)|le(86400), true(), false())}
{/if}

<div class="openpa-panel {$node|access_style} {$node.class_identifier}">

    {if $show_image}
        {include uri='design:openpa/panel/parts/image.tpl'}
    {/if}

    <div class="openpa-panel-content">
        {if $is_program|not()}
            <time class="event-date" datetime="{$time}">
                {if $sameDay|not()}<span class="starts">Dal</span>{/if}
                <span class="day">{$day}</span>
                <span class="month">{$month}</span>
                <span class="year">{$year}</span>
            </time>
        {/if}

        <h3 class="Card-title"{if $is_program} style="width: 100%; float:none"{/if}>
            <a class="Card-titleLink" href="{$openpa.content_link.full_link}"
               title="{$node.name|wash()}">{$node.name|wash()}</a>
        </h3>

        {if and( $to, $sameDay|not() )}
            <div class="place"{if $is_program} style="width: 100%; float:none"{/if}>
                <p><i class="fa fa-calendar" aria-hidden="true"></i> {$from|datetime( 'custom', '%d %M %Y' )} - {$to|datetime( 'custom', '%d %M %Y' )}</p>
            </div>
        {/if}

        {if or( $node|has_attribute( 'indirizzo' ), $node|has_attribute( 'luogo_svolgimento' ), $node|has_attribute( 'comune' ))}
            <div class="place"{if $is_program} style="width: 100%; float:none"{/if}>
                <p><i class="fa fa-map-marker" aria-hidden="true"></i>
                    {if $node|has_attribute( 'indirizzo' )}
                        <span>{attribute_view_gui attribute=$node.data_map.indirizzo}</span>
                    {/if}
                    {if $node|has_attribute( 'luogo_svolgimento' )}
                        <span>{attribute_view_gui attribute=$node.data_map.luogo_svolgimento}</span>
                    {/if}
                    {if $node|has_attribute( 'comune' )}
                        <span>{attribute_view_gui attribute=$node.data_map.comune}</span>
                    {/if}
                </p>
            </div>
        {/if}

        {*<div class="Card-text"{if $is_program} style="width: 100%; float:none"{/if}>
            <p>{$node|abstract()|oc_shorten(100)}</p>
        </div>*}
    </div>
</div>
{undef $from $to $year $time $sameDay}


