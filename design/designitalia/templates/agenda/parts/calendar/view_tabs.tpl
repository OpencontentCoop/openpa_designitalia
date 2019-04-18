{if is_set($extra_parameters)|not }
  {def $extra_parameters = class_extra_parameters($node.class_identifier)}
{/if}

{def $data_attributes = ''}
{if and(is_set($extra_parameters.event_calendar), $extra_parameters.event_calendar.enabled, $extra_parameters.event_calendar.min_time|ne(''))}
  {set $data_attributes = concat('data-min_time="', $extra_parameters.event_calendar.min_time, ':00', '"')}
{/if}

{if and(is_set($extra_parameters.event_calendar), $extra_parameters.event_calendar.enabled, $extra_parameters.event_calendar.max_time|ne(''))}
  {set $data_attributes = concat($data_attributes, concat(' data-max_time="', $extra_parameters.event_calendar.max_time, ':00', '"'))}
{/if}

<div class="tab-content u-margin-top-s">
    {if $views|contains('agenda')}
        <div id="agenda" class="tab-pane{if and($current_view, $current_view|eq('agenda'))} active{/if}" data-default_view="{$default_agenda_view}" {$data_attributes}></div>
    {/if}
    {if $views|contains('list')}
        <div id="list" class="tab-pane{if and($current_view, $current_view|eq('list'))} active{/if}">
            <section id="calendar" class="service_teasers row"></section>
        </div>
    {/if}
</div>

{undef $data_attributes}
