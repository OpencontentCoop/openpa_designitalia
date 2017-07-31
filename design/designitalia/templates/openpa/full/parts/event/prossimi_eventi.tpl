{def $iniziativa = false()}
{if and( is_set($node.data_map.iniziativa), $node.data_map.iniziativa.has_content )}
    {set $iniziativa = fetch( 'content', 'node', hash( 'node_id', $node.data_map.iniziativa.content.relation_list[0].node_id ) )}
    {def $calendarData = fetch( openpa, calendario_eventi, hash( 'calendar', $node.parent, 'params', hash( 'interval', 'P6M',
    'filter', array( concat( '-meta_id_si:', $node.contentobject_id ) ),
    'Manifestazione', concat( $iniziativa.name ) )|merge( $view_parameters ) ) )}
{else}
    {def $root = fetch( content, node, hash( node_id, ezini( 'NodeSettings', 'RootNode', 'content.ini' ) ) )
    $calendarData = fetch( openpa, calendario_eventi, hash( 'calendar', $root, 'params', hash( 'interval', 'P6M',
    'filter', array( concat( '-meta_id_si:', $node.contentobject_id ) ),
    'Manifestazione', concat( $node.name ) )|merge( $view_parameters ) ) )}
{/if}
{*debug-log var=$calendarData msg='object contents'*}
{if $calendarData.search_count|gt(0)}


    {if and( $iniziativa, $iniziativa.contentobject_id|ne( $node.contentobject_id ) )}
        <p>Questo evento fa parte della manifestazione <a href={$iniziativa.url_alias|ezurl()} title="Vedi il dettaglio di {$iniziativa.name|wash()}">{$iniziativa.name|wash()}</a></p>
        <h3>{$iniziativa.name|wash()}: i prossimi appuntamenti</h3>
    {else}
        <h2>I prossimi appuntamenti in programma</h2>
    {/if}


    <div class="calendar-day-program float-break Grid Grid--withGutter events">
        {foreach $calendarData.day_by_day as $calendarDay}
            {if $calendarDay.count|gt(0)}

                <div class="calendar-date Grid-cell u-md-size1of6 u-lg-size1of6"{if $calendarDay.is_today} id="today"{/if}>
                    <div class="u-margin-r-all">
                        <span class="month">{$calendarDay.start|datetime( 'custom', '%M' )}</span>
                        <span class="day">{$calendarDay.start|datetime( 'custom', '%j' )}</span>
                    </div>
                </div>

                <div class="calendar-date Grid-cell u-md-size5of6 u-lg-size5of6 u-margin-bottom-s" id="day-{$calendarDay.identifier}">
                    <div class="Grid Grid--withGutter openpa-panels-container">
                        {foreach $calendarDay.events as $event}
                        <div class="u-lg-size1of2">
                            {node_view_gui view=panel content_node=$event.node image_class=small is_program=true()}
                        </div>
                        {delimiter modulo=2}</div><div class="Grid Grid--withGutter openpa-panels-container">{/delimiter}
                        {/foreach}
                    </div>
                </div>
            {/if}
        {/foreach}
    </div>

{elseif and( $iniziativa, $iniziativa.contentobject_id|ne( $node.contentobject_id ) )}
    <p>Questo evento fa parte della manifestazione <a href={$iniziativa.url_alias|ezurl()} title="Vedi il dettaglio di {$iniziativa.name|wash()}">{$iniziativa.name|wash()}</a></p>
{/if}
{undef $iniziativa}
