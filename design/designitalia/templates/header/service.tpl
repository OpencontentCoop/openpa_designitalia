{def $header_service = openpaini('GeneralSettings','header_service', 1)}

{if $header_service|eq(1)}
    <div class="Header-banner">
        <div class="Header-owner Headroom-hideme">
            <a href="{openpaini('InstanceSettings','UrlAmministrazioneAfferente', '#')}">
                <span>{openpaini('InstanceSettings','NomeAmministrazioneAfferente', 'Provincia autonoma di Trento')}</span>
            </a>

            {include uri='design:header/languages.tpl'}

        </div>
    </div>
{/if}
