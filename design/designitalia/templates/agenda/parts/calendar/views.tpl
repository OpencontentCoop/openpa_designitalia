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
        {include uri='design:agenda/parts/calendar/view_tabs.tpl' views=$views}
    </div>

</div>


<script type="text/javascript">
    {literal}
    $(document).ready(function() {
        $("#agenda-container").tabs({
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
