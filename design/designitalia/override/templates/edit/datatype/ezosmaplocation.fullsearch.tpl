{if is_set( $attribute_base )|not}{def $attribute_base = 'ContentObjectAttribute'}{/if}

<fieldset class="Form-field{if $attribute.has_validation_error} has-error{/if}">
    <legend class="Form-label {if $attribute.is_required}is-required{/if}">
        {first_set( $contentclass_attribute.nameList[$content_language], $contentclass_attribute.name )|wash}
        {if $attribute.is_information_collector} <em
                class="collector">{'information collector'|i18n( 'design/admin/content/edit_attribute' )}</em>{/if}
        {if $attribute.is_required} ({'richiesto'|i18n('design/ocbootstrap/designitalia')}){/if}
    </legend>


{def $latitude  = $attribute.content.latitude|explode(',')|implode('.')
     $longitude = $attribute.content.longitude|explode(',')|implode('.')
     $contacts = openpapagedata().contacts}

<div class="Grid Grid--withGutter" data-gmap-attribute="{$attribute.id}">
    <div class="ezgml-data Grid-cell u-size12of12 u-sm-size12of12 u-md-size6of12 u-lg-size6of12">
        <div id="edit-map-{$attribute.id}" style="min-width: 200px; width: 100%;  max-width:100%; height: 500px; margin-top: 2px;"></div>

        <div class="block address">
            <input class="ezgml_new_address u-text-xxs"
                   style="width: 100%"
                   type="text"
                   name="{$attribute_base}_data_gmaplocation_address_{$attribute.id}"
                   value="{$attribute.content.address}"/>
            <input class="ezgml_hidden_address"
                   type="hidden"
                   name="ezgml_hidden_address"
                   value="{$attribute.content.address}"
                   disabled="disabled"/>
        </div>

        <div class="element latitude">
            <label class="u-text-xxs">Latitudine</label>
            <input class="ezgml_new_latitude u-text-xxs"
                   type="text"
                   name="{$attribute_base}_data_gmaplocation_latitude_{$attribute.id}"
                   value="{$latitude}"/>
            <input class="ezgml_hidden_latitude"
                   type="hidden"
                   name="ezgml_hidden_latitude"
                   value="{$latitude}"
                   disabled="disabled"/>
        </div>

        <div class="element longitude">
            <label class="u-text-xxs">Longitudine</label>
            <input class="ezgml_new_longitude u-text-xxs"
                   type="text"
                   name="{$attribute_base}_data_gmaplocation_longitude_{$attribute.id}"
                   value="{$longitude}"/>
            <input class="ezgml_hidden_longitude"
                   type="hidden"
                   name="ezgml_hidden_longitude"
                   value="{$longitude}"
                   disabled="disabled"/>
        </div>

    </div>

    <div class="ezgml-form Grid-cell u-size12of12 u-sm-size12of12 u-md-size6of12 u-lg-size6of12">

        <div class="ezgml-form-fields">
            <legend>Cerca un punto sulla mappa</legend>
            <div class="Form-field">
                <input class="box" type="hidden" name="query" placeholder="Query" value=""/>
            </div>

            <div class="Form-field">
                <label>Indirizzo</label>
                <input type="text" class="Form-input" name="street" placeholder="Indirizzo" value=""/>
            </div>

            {*<div class="block">
                <label>Numero</small>
                 <input type="text" class="box" name="house_number" placeholder="Numero" size="5" value=""/>
            </div>*}

            <div class="Form-field">
                <label class="Form-label">CAP</label>
                <input type="text" name="postcode" class="Form-input" placeholder="CAP" size="10" value="{if is_set($contacts.cap)}{$contacts.cap|wash()}{/if}"/>
            </div>

            <div class="Form-field">
                <label class="Form-label">Città</label>
                <input type="text" name="city" placeholder="City" class="Form-input" size="20" value="{if is_set($contacts.comune)}{$contacts.comune|wash()}{/if}"/>
            </div>

            <div class="Form-field">
                <label class="Form-label">Provincia</label>
                <input type="text" name="county" placeholder="Provincia" class="Form-input" size="20" value="Provincia Autonoma di Trento"/>
            </div>

            <div class="Form-field">
                <label class="Form-label">Regione</label>
                <input type="text" name="state" placeholder="Regione" class="Form-input" size="20" value="Trentino-Alto Adige"/>
            </div>

            <div class="Form-field">
                <label class="Form-label">Stato</label>
                <input type="text" name="country" placeholder="Stato" class="Form-input" size="20" value="Italia"/>
            </div>
        </div>

        <button class="defaultbutton btn-sm" name="GeoSearch">Cerca indirizzo</button>
        <button class="button btn-sm" name="MyLocation" title="Rileva posizione del dispositivo"><i class="fa fa-location-arrow"></i> </button>
        <button class="button btn-sm" name="Reset">Annulla</button>
    </div>

    <div class=" ezgml-search-results Grid-cell u-size12of12 u-sm-size12of12 u-md-size6of12 u-lg-size6of12 u-border-top-m u-background-white" style="display: none;">

    </div>
</div>

{ezcss_require(array(
    'leaflet/leaflet.0.7.2.css',
    'leaflet/Control.Loading.css',
    'leaflet/MarkerCluster.css',
    'leaflet/MarkerCluster.Default.css',
    'ez.css'
))}
{ezscript_require(array(
    'plugins/leaflet/leaflet.0.7.2.js',
    'ezjsc::jquery',
    'plugins/edit.js',
    'plugins/leaflet/leaflet.activearea.js',
    'plugins/leaflet/leaflet.markercluster.js',
    'plugins/leaflet/Leaflet.MakiMarkers.js',
    'plugins/leaflet/Control.Geocoder.js',
    'plugins/leaflet/Control.Loading.js'
))}
</fieldset>
