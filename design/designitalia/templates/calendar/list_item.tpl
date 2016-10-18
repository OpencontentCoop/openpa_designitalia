<li class="Entrypoint-item u-background-50 u-textBreak">
    <p>
        <a class="u-color-white" href={$event.main_url_alias|ezurl()} title="{$item.name|wash()}">
            {$item.name|wash()}
            <span class="Tooltip Tooltip--styled fr-tooltip js-fr-tooltip">
                <span class="Tooltip-toggle js-fr-tooltip-toggle"> (+)</span>
                <span class="Tooltip-tooltip fr-tooltip-tooltip js-fr-tooltip-tooltip u-color-black">
                    {$item.name|wash()}
                </span>
            </span>
        </a>
    </p>
</li>
