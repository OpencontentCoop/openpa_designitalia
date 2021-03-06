{ezcss_require( array( 'plugins/table-calendar.css' ) )}
<script>
{literal}
$(function() {
    $(".calendar_picker").datepicker({
      defaultDate: "+1w",
      changeMonth: true,
      changeYear: true,
      dateFormat: "dd-mm-yy",
      numberOfMonths: 1
    });
});
{/literal}
</script>

{def $calendarData = fetch( openpa, calendario_eventi, hash( 'calendar', $node, 'params', $view_parameters|merge( hash( 'interval', 'P1M', 'view', 'calendar' ) ) ) )}


{def $curr_ts = currentdate()
    $curr_today = $calendarData.parameters.current_day
    $curr_year = $calendarData.parameters.current_year
    $curr_month = $calendarData.parameters.current_month
    $temp_month = $calendarData.parameters.month
    $temp_year = $calendarData.parameters.year
    $temp_today = $calendarData.parameters.day
    $days = $calendarData.parameters.days_of_month
    $span1 = $calendarData.parameters.start_weekday
    $span2 = sub( 7, $calendarData.parameters.end_weekday )
    $dayofweek = 0
    $counter = 1
    $col_counter = 1
    $css_col_class = ''
    $col_end = 0}

{def $dayofweeks = array(
"Sunday"|i18n("ocbootstrap/calendar"),
"Monday"|i18n("ocbootstrap/calendar"),
"Tuesday"|i18n("ocbootstrap/calendar"),
"Wednesday"|i18n("ocbootstrap/calendar"),
"Thursday"|i18n("ocbootstrap/calendar"),
"Friday"|i18n("ocbootstrap/calendar"),
"Saturday"|i18n("ocbootstrap/calendar"),
)}

<form class="Form Form--spaced" method='GET' action={concat('openpa/calendar/', $node.node_id)|ezurl}>
    <input type='hidden' name="UrlAlias" value="{$node.url_alias}" />
    <input type='hidden' name="View" value="calendar" />
    <input type="hidden" name="SearchDate" value="{$calendarData.parameters.picker_date}" />

    <fieldset class="Form-fieldset">
        {*<legend class="Form-legend">Calendario</legend>*}
        <div class="Grid">
            <div class="Form-field Grid-cell u-sizeFull">
                {*<input type="submit" name="ViewCalendarButton" class="btn btn-primary hidden-xs" value="Calendario" />*}
                <input type="submit" name="ViewProgramButton" class="btn btn-default hidden-xs" value="Visualizza lista" />
            </div>
        </div>

        <div class="Grid u-padding-all-s u-background-grey-10">
            <div class="Form-field Grid-cell u-sizeFull u-sm-size1of2 u-md-size1of2 u-lg-size1of2">
                <label class="Form-label u-hiddenVisually" for="Sort">{'Search in text'|i18n('openpa_designitalia')}</label>
                <input id="calendar_query"  class="query Form-input" placeholder="{'Search'|i18n('openpa_designitalia')}" type="text" name="Query" value="{$calendarData.parameters.query|wash()}" />
            </div>

            <div class="Form-field Grid-cell u-sizeFull u-sm-size1of2 u-md-size1of2 u-lg-size1of2">
                <label class="Form-label u-hiddenVisually" for="Order">{'Select date'|i18n('openpa_designitalia')}</label>
                <input id="calendar_picker" class="calendar_picker Form-input" placeholder="gg-mm-yyyy" type="text" name="SearchDate" title="Seleziona data" value="{$calendarData.parameters.picker_date|wash()}" />
            </div>

            {foreach $calendarData.search_facets as $facetFieldName => $facets}
            {if count($facets)|gt(0)}
                <div class="Form-field Grid-cell u-sizeFull u-sm-size1of2 u-md-size1of2 u-lg-size1of2">
                    {foreach $calendarData.search_facets as $facetFieldName => $facets}

                            <label class="Form-label u-hiddenVisually" for="calendar_facet">{'Search'|i18n('openpa_designitalia')} {$facetFieldName}</label>
                            <select name="{$facetFieldName}" class="Form-input" id="calendar_facet">
                                <option value="">{$facetFieldName}</option>
                                {foreach $facets as $styleAndName}
                                    <option value="{$styleAndName.value|wash()}"{if $calendarData.parameters[$facetFieldName]|eq($styleAndName.value)} selected="selected"{/if}>{if $styleAndName.indent}&nbsp;&nbsp;&nbsp;{/if}{$styleAndName.name|wash()}</option>
                                {/foreach}
                            </select>

                    {/foreach}
                </div>
            {/if}
            {/foreach}

            {if and( count($calendarData.search_facets)|eq(0), is_set( $view_parameters.Manifestazione ) )}
                <div class="Form-field Grid-cell u-sizeFull u-sm-size1of2 u-md-size1of2 u-lg-size1of2">
                    <label class="Form-label u-hiddenVisually" for="calendar_facet">{'Search event collection'|i18n('openpa_designitalia')}</label>
                    <select name="Manifestazione" class="Form-input" id="calendar_facet">
                        <option value="">Manifestazione</option>
                        <option value="{$view_parameters.Manifestazione|wash()}" selected="selected">{$view_parameters.Manifestazione|wash()}</option>
                    </select>
                </div>
            {/if}
            <div class="Form-field Grid-cell u-size1of3 u-sm-size1of2 u-md-size1of2 u-lg-size1of2">
                <button class="Button Button--default" type="submit" name="SearchButton" title="{'Search'|i18n('openpa_designitalia')}"><i class="fa fa-search"></i> {'Search'|i18n('openpa_designitalia')}</button>
            </div>
            <div class="Form-field Grid-cell u-size2of3 u-sm-size1of2 u-md-size1of2 u-lg-size1of2">
                <button class="Button Button--info" type="submit" name="TodayButton" title="{'Reset search'|i18n('openpa_designitalia')}"><i class="fa fa-close"></i> {'Reset search'|i18n('openpa_designitalia')}</button>
            </div>
        </div>
    </fieldset>

    <div class="Grid">
        <div class="Form-field Grid-cell u-size1of3 u-md-size1of3 u-lg-size1of3">
            <input type="submit" name="PrevMonthCalendarButton" class="btn btn-default" value="&laquo;" />
        </div>
        <div class="Form-field Grid-cell u-size1of3 u-md-size1of3 u-lg-size1of3 u-textCenter">
            <h3>{$calendarData.parameters.timestamp|datetime( custom, '%F' )|upfirst()}&nbsp;{$temp_year}</h3>
        </div>
        <div class="Form-field Grid-cell u-size1of3 u-md-size1of3 u-lg-size1of3 u-textRight">
            <input type="submit" name="NextMonthCalendarButton" class="btn btn-default " value="&raquo;" />
        </div>
    </div>

    {*<div class="well well-sm calendar-tools">
      <label class="hide" for="calendar_query">Cerca nel testo</label>
      <input id="calendar_query"  class="query form-control" placeholder="Cerca tra gli eventi" type="text" name="Query" value="{$calendarData.parameters.query|wash()}" />

      <label class="hide" for="calendar_picker">Seleziona data</label>
      <input id="calendar_picker" class="calendar_picker form-control" placeholder="gg-mm-yyyy" type="text" name="SearchDate" title="Seleziona data" value="{$calendarData.parameters.picker_date|wash()}" />

      {foreach $calendarData.search_facets as $facetFieldName => $facets}
          {if count($facets)|gt(0)}
          <label class="hide" for="calendar_facet">Cerca {$facetFieldName}</label>
          <select name="{$facetFieldName}" class="form-control" id="calendar_facet">
              <option value="">{$facetFieldName}</option>
              {foreach $facets as $styleAndName}
                  <option value="{$styleAndName.value|wash()}"{if $calendarData.parameters[$facetFieldName]|eq($styleAndName.value)} selected="selected"{/if}>{if $styleAndName.indent}&nbsp;&nbsp;&nbsp;{/if}{$styleAndName.name|wash()}</option>
              {/foreach}
          </select>
          {/if}
      {/foreach}

      {if and( count($calendarData.search_facets)|eq(0), is_set( $view_parameters.Manifestazione ) )}
          <label class="hide" for="calendar_facet">Cerca Manifestazione</label>
          <select name="Manifestazione" class="form-control" id="calendar_facet">
              <option value="">Manifestazione</option>
              <option value="{$view_parameters.Manifestazione|wash()}" selected="selected">{$view_parameters.Manifestazione|wash()}</option>
          </select>
      {/if}

      <button class="defaultbutton" type="submit" name="SearchButton" title="Cerca"><i class="fa fa-search"></i></button>
      <button class="button" type="submit" name="TodayButton" title="Azzera la ricerca"><i class="fa fa-close"></i></button>
    </div>*}

    <figure>
        <div id="no-more-tables">
            <table class="openpa-table-calendar">
            <thead>
            <tr>
                <th>{"Mon"|i18n("design/ocbootstrap/full/event_view_calendar")}</th>
                <th>{"Tue"|i18n("design/ocbootstrap/full/event_view_calendar")}</th>
                <th>{"Wed"|i18n("design/ocbootstrap/full/event_view_calendar")}</th>
                <th>{"Thu"|i18n("design/ocbootstrap/full/event_view_calendar")}</th>
                <th>{"Fri"|i18n("design/ocbootstrap/full/event_view_calendar")}</th>
                <th>{"Sat"|i18n("design/ocbootstrap/full/event_view_calendar")}</th>
                <th>{"Sun"|i18n("design/ocbootstrap/full/event_view_calendar")}</th>
            </tr>
            </thead>
            <tbody>

            {while le( $counter, $days )}
                {set $dayofweek = makedate( $temp_month, $counter, $temp_year )|datetime( custom, '%w' )
                $css_col_class = ''
                $col_end = or( eq( $dayofweek, 0 ), eq( $counter, $days ) )}
                {if or( eq( $counter, 1 ), eq( $dayofweek, 1 ) )}
                    <tr class="{if eq( $counter, 1 )} first_row{elseif lt( $days|sub( $counter ), 7 )} last_row{/if}">
                    {set $css_col_class=' first_col'}
                {elseif and( $col_end, not( and( eq( $counter, $days ), $span2|gt( 0 ), $span2|ne( 7 ) ) ) )}
                    {set $css_col_class=' last_col'}
                {/if}
                {if and( $span1|gt( 1 ), eq( $counter, 1 ) )}
                    {set $col_counter=1 $css_col_class=''}
                    {while ne( $col_counter, $span1 )}
                        <td class="not-in-current-month {$css_col_class}">&nbsp;</td>
                        {set $col_counter=inc( $col_counter )}
                    {/while}
                {elseif and( eq($span1, 0 ), eq( $counter, 1 ) )}
                    {set $col_counter=1 $css_col_class=''}
                    {while le( $col_counter, 6 )}
                        <td class="not-in-current-month {$css_col_class}">&nbsp;</td>
                        {set $col_counter=inc( $col_counter )}
                    {/while}
                    {set $css_col_class=' last_col'}
                {/if}

                {def $day_id = concat( $temp_year, '-', $temp_month, '-', $counter )}
                <td  data-title="{$counter}" class="{if and( is_set( $calendarData.day_by_day[$day_id] ), $calendarData.day_by_day[$day_id].count|gt(0) )}events {/if}{if eq($counter, $temp_today)}ezagenda_selected {/if}{if and(eq($counter, $curr_today), eq($curr_month, $temp_month))}ezagenda_current {/if}{$css_col_class}">
                    <h3 class="day"><span class="day-of-week">{$dayofweeks[$dayofweek]|i18n("design/ocbootstrap/full/event_view_calendar")}</span> <span class="num {if and(eq($counter, $curr_today), eq($curr_month, $temp_month))}label label-primary{/if}">{$counter}</span></h3>
                    {if is_set( $calendarData.day_by_day[$day_id] )}
                        {if $calendarData.day_by_day[$day_id].count|gt(0)}
                            <ul>
                                {foreach $calendarData.day_by_day[$day_id].events as $event max 4}
                                    {include uri="design:calendar/list_item.tpl" item=$event}
                                {/foreach}

                                {if $calendarData.day_by_day[$day_id].count|gt(4)}
                                    {def $altri = $calendarData.day_by_day[$day_id].count|sub(4)
                                    $title = ''}
                                    {foreach $calendarData.day_by_day[$day_id].events as $event offset 4}
                                        {set $title = concat( $title, $event.name|wash(), ', ' )}
                                    {/foreach}
                                    <li class="Entrypoint-item u-background-50 u-textBreak">
                                        <p>
                                            <a class="u-color-white" href="{concat( $node.url_alias, '/(view)/program', $calendarData.day_by_day[$day_id].uri_suffix, '#day-', $calendarData.day_by_day[$day_id].identifier )|ezurl(no)}">
                                                <em>{if $altri|eq(1)}{'...and another event'|i18n('openpa_designitalia')}{else}{'...and another %number events'|i18n('openpa_designitalia', '', hash('%number', $altri))}{/if}</em>
                                            </a>
                                        </p>
                                    </li>
                                    {undef $altri $title}
                                {/if}
                            </ul>
                        {/if}
                    {/if}
                    {undef $day_id}
                </td>

                {if and( eq( $counter, $days ), $span2|gt( 0 ), $span2|ne(7))}
                    {set $col_counter = 1}
                    {while le( $col_counter, $span2 )}
                        {set $css_col_class = ''}
                        {if eq( $col_counter, $span2 )}
                            {set $css_col_class = concat($css_col_class,' last_col')}
                        {/if}
                        <td class="not-in-current-month {$css_col_class}">&nbsp;</td>
                        {set $col_counter = inc( $col_counter )}
                    {/while}
                {/if}
                {if $col_end}
                    </tr>
                {/if}
                {set $counter = inc( $counter )}
            {/while}

            </tbody>
        </table>
    </div>
	</figure>
</form>

{literal}
    <script>$(document).ready(function(){$('.has-tooltip').tooltip();});</script>
{/literal}
