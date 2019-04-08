<div class="u-padding-bottom-xxl">
    <h2 class="u-text-h2">
        Confermi la pubblicazione del contenuto?
    </h2>

    <div class="openpa-full">
        <div class="content-detail u-layout-prose">
            {foreach $version.data_map as $attribute}
                {if $attribute.has_content}
                <div class="content-detail-item withLabel">
                    <div class="label u-text-h6">
                        <strong>{$attribute.contentclass_attribute_name}</strong>
                    </div>
                    <div class="value">
                        <div class="Prose u-padding-left-s">
                            {attribute_view_gui attribute=$attribute show_newline=true()}
                        </div>
                    </div>
                </div>
                {/if}
            {/foreach}
        </div>
    </div>

    <div class="Grid Grid--withGutter u-padding-top-xxl">
        <div class="Grid-cell u-size1of2">
            <a class="Button Button--danger" href="{concat('gdpr/confirmpublish/0/', $version.contentobject_id, '/', $version.version, '/', $language)|ezurl('no')}">
                Non confermo
            </a>
        </div>
        <div class="Grid-cell u-size1of2 u-textRight">
            <a class="Button Button--default" href="{concat('gdpr/confirmpublish/1/', $version.contentobject_id, '/', $version.version, '/', $language)|ezurl('no')}">
                Confermo la pubblicazione
            </a>
        </div>
    </div>
</div>
