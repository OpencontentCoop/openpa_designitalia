{if is_set($view_all)|not()}
  {def $view_all = false()}
{/if}

<style>
  {literal}
  #agenda-container .ui-tabs-panel {
    background-color: #fff !important;
  }

  {/literal}
</style>

<div class="Grid Grid--withGutter" id="agenda-container">

  <div class="Grid-cell u-sizeFull">
    {include uri='design:agenda/parts/calendar/view_pills.tpl' views=$views}
    {include uri='design:agenda/parts/calendar/filters.tpl' view_all=$view_all}
    {include uri='design:agenda/parts/calendar/view_tabs.tpl' views=$views}
  </div>

</div>
