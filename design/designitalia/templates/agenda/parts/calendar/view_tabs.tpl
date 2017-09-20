<div class="tab-content u-margin-top-s">
    {if $views|contains('agenda')}
        <div id="agenda" class="tab-pane active "></div>
    {/if}
    {if $views|contains('list')}
        <div id="list" class="tab-pane">
            <section id="calendar" class="service_teasers row"></section>
        </div>
    {/if}
</div>
