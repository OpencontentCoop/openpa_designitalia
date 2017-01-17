{def $valid_node = cond( is_set( $block.valid_nodes[0] ), $block.valid_nodes[0], false() )
     $show_link = true()}

{if and( $valid_node|not(), is_set( $block.custom_attributes.source ) )}
    {set $valid_node = fetch( content, node, hash( node_id, $block.custom_attributes.source ) )}
{/if}

{if $valid_node|not()}
    {set $valid_node = fetch( content, node, hash( node_id, ezini( 'NodeSettings', 'RootNode', 'content.ini' ) ) )
    $show_link = false()}
{/if}

{def $calendarDataDay = fetch( openpa, calendario_eventi, hash( 'calendar', $valid_node, 'params', hash( 'interval', 'PT1439M' ) ) )}
{if and(is_set($block.custom_attributes.tab_title),$block.custom_attributes.tab_title|ne(''))}
    {def $calendarDataOther = fetch( openpa, calendario_eventi, hash( 'calendar', $valid_node, 'params', $block.custom_attributes ) )}
{else}
    {def $calendarDataOther = false()}
{/if}
{*debug-log var=$calendarDataDay.fetch_parameters msg='Blocco eventi fetch oggi'*}

{def $day_events = $calendarDataDay.events
     $day_events_count = $calendarDataDay.search_count
     $prossimi = array()
     $prossimi_count = 0}

{if $calendarDataOther}
    {*debug-log var=$calendarDataOther.fetch_parameters msg='Blocco eventi fetch secondo tab'*}
    {set $prossimi = $calendarDataOther.events
         $prossimi_count = $calendarDataOther.search_count}
{/if}

{if and( $prossimi_count|eq(0), $day_events_count|eq(0) )}

    {if fetch( 'user', 'has_access_to', hash( 'module', 'openpa', 'function', 'editor_tools' ) )}
        {editor_warning( "Nessun evento in programma" )}
    {/if}

{else}

    <div id="{$block.id}" class="openpa-widget {$block.view} {if is_set($block.custom_attributes.color_style)}color color-{$block.custom_attributes.color_style}{/if}">

        <div class="events_wide_wrapper">
            <div class="u-layout-wide u-layoutCenter">

                {if $block.name|ne('')}
                    <h3 class="u-text-h3">
                        {$block.name|wash()}
                    </h3>
                {/if}

                <div class="events_toolbar">


                    {if and( $day_events_count|gt(0), $prossimi_count|gt(0) )}
                        <ul role="tablist">
                            {if $day_events_count|ne(0)}
                                <li class="eventi-oggi">
                                    <a href="#oggi" data-toggle="tab">
                                        <i class="fa fa-clock-o"></i> Oggi
                                    </a>
                                </li>
                            {/if}
                            {if $prossimi_count|gt(0)}
                                <li class="eventi-futuri eventi-{$block.custom_attributes.tab_title|slugize}">
                                    <a href="#{$block.custom_attributes.tab_title|slugize}" data-toggle="tab">
                                        <i class="fa fa-calendar-o"></i> {$block.custom_attributes.tab_title}
                                    </a>
                                </li>
                            {/if}

                            {if $show_link}
                                <li class="jump-to-calendar">
                                    <a href="{$valid_node.url_alias|ezurl(no)}" title="Vai al calendario">
                                        <i class="fa fa-calendar"></i> Tutti
                                    </a>
                                </li>
                            {/if}

                        </ul>
                    {/if}

                </div>
            </div>

        </div>

            {if $day_events_count|ne(0)}
                <div class="u-layout-leftContent" id="oggi" style="display: none;">
                    <section class="js-Masonry-container" data-columns="3">
                        {foreach $day_events as $i => $child max 10}
                        <div class="Masonry-item js-Masonry-item">
                            {node_view_gui content_node=$child.node view=panel image_class=carousel event=$child}
                        </div>
                        {/foreach}
                    </section>
                </div>
            {/if}

            {if $prossimi_count|gt(0)}
                <div id="{$block.custom_attributes.tab_title|slugize}" class="u-layout-centerContent " style="display: none;">
                    <section class="js-Masonry-container" data-columns="3">
                        {foreach $prossimi as $i => $child max 10}
                        <div class="Masonry-item js-Masonry-item">
                            {node_view_gui content_node=$child.node view=panel image_class=carousel event=$child}
                        </div>
                        {/foreach}
                    </section>
                </div>
            {/if}

    </div>

    <script type="text/javascript">
        {literal}
        $(document).ready(function() {
            $("#{/literal}{$block.id}{literal}").tabs({
                active: false,
                collapsible: true,
                beforeActivate: function( event, ui ) {
                    if (ui.newTab.hasClass('jump-to-calendar')){
                        window.location.href = ui.newTab.find('a').attr('href');
                        return false;
                    }
                }
            });
        });
        {/literal}
    </script>



{/if}

