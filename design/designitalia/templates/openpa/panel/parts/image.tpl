{if $node|has_attribute('image')}
    <div class="openpa-panel-image">
        <img src="{$node|attribute('image').content['agid_panel'].full_path|ezroot(no)}"
             alt=""
             class="u-sizeFull"
             role="presentation" />
    </div>
{/if}
