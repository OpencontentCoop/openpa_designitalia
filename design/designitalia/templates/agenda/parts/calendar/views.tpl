{if is_set($view_all)|not()}
    {def $view_all = false()}
{/if}

<style>
    {literal}
    #calendar-{/literal}{$node.contentobject_id}{literal} .ui-tabs-panel {
        background-color: #fff !important;
    }
    {/literal}
</style>

<div class="Grid Grid--withGutter" id="calendar-{$node.contentobject_id}">

    <div class="Grid-cell u-sizeFull">
        {include uri='design:agenda/parts/calendar/view_pills.tpl' views=$views}
        {include uri='design:agenda/parts/calendar/view_tabs.tpl' views=$views}
    </div>

    {*<div class="Grid-cell u-sizeFull u-md-size9of12 u-lg-size9of12">
        {include uri='design:agenda/parts/calendar/view_tabs.tpl' views=$views}
    </div>
    <div class="Grid-cell u-sizeFull u-md-size3of12 u-lg-size3of12">
        {include uri='design:agenda/parts/calendar/view_pills.tpl' views=$views}
        include uri='design:agenda/parts/calendar/filters.tpl' view_all=$view_all
    </div>*}
</div>


<script type="text/javascript">
    {literal}
    $(document).ready(function() {
        $("#calendar-{/literal}{$node.contentobject_id}{literal}").tabs({
            select: function(event) {
                // You need Firebug or the developer tools on your browser open to see these
                console.log(event);
                // This will get you the index of the tab you selected
                console.log(event.options.selected);
                // And this will get you it's name
                console.log(event.tab.text);
            }
        });
    });
    {/literal}
</script>
