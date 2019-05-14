{literal}
  <style>
    .agenda-filters li {
      margin-top: 12px;
      margin-right: 16px;
      background-color: #fff;
      padding: 8px 16px;
      border-radius: 4px;
      border: 1px solid #ccc;
    }

    .agenda-filters li.active {
      background-color: #ddd;
    }
  </style>
{/literal}




<div class="Grid Grid--withGutter">
  <div class="Grid-cell u-sizeFull widget agenda-filters" data-filter="q" style="display: none">
      <div class="input-group">
          <input type="text" class="form-control" placeholder="Cerca nel titolo o nel testo" name="srch-term"
                 id="srch-term">
          <div class="input-group-btn">
              <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i>
              </button>
          </div>
      </div>
  </div>

  {def $extra_parameters = class_extra_parameters($node.class_identifier)}

  <div class="Grid-cell u-sizeFull u-margin-all-s widget agenda-filters {if $current_view|eq('agenda')}hide{/if}" data-filter="date">
    <h4>{'Quando?'|i18n('agenda')}</h4>
    <ul class="u-sm-flexInline u-md-flexInline u-lg-flexInline">
      {if and(is_set($extra_parameters.event_calendar), $extra_parameters.event_calendar.enabled, $extra_parameters.event_calendar.filters|count()|gt(0))}
        {foreach $extra_parameters.event_calendar.filters as $filter}
          <li {if $filter|eq($extra_parameters.event_calendar.default_filter)}class="active"{/if}><a href="#" data-value="{$filter}">{$filter|i18n('openpa/agenda')}</a></li>
        {/foreach}
      {else}
        <li><a href="#" data-value="today">{'today'|i18n('agenda')}</a></li>
        <li><a href="#" data-value="weekend">{'weekend'|i18n('openpa/agenda')}</a></li>
        <li class="active"><a href="#" data-value="month">{'month'|i18n('openpa/agenda')}</a></li>
        <li><a href="#" data-value="next 7 days">{'next 7 days'|i18n('openpa/agenda')}</a></li>
        <li><a href="#" data-value="next 30 days">{'next 30 days'|i18n('openpa/agenda')}</a></li>
        <li><a href="#" data-value="all">{'all'|i18n('openpa/agenda')}</a></li>
      {/if}
    </ul>
  </div>


</div>
