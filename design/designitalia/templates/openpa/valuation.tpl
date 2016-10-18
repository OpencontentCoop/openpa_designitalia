{*
	TEMPLATE  per la valutazione delle pagine da parte degli utenti
	node_id	nodo di riferimento
*}

{def $valuations=fetch( 'content', 'class', hash( 'class_id', 'valuation' ) )}

{if and( $valuations|count(), $valuations.object_list|count() )}
    <div class="valuation u-padding-all-xxl u-color-white text-left" xmlns="http://www.w3.org/1999/html">


        {def $valutazione=$valuations.object_list[0]
        $node = fetch(content,node,hash(node_id,$node_id))
        $data_map=$valutazione.data_map}

        <form class="Form Form--spaced" action="{'/content/action'|ezurl(no)}" method="post">
            <div class="Grid Grid--withGutter">
                <div class="Grid-cell u-md-size4of12 u-lg-size4of12 u-md-before1of12 u-lg-before1of12">

                    {if is_set( $data_map.useful )}
                        <input type="hidden" value=""
                               name="ContentObjectAttribute_ezselect_selected_array_{$data_map.useful.id}"/>
                        <fieldset class="Form-field Form-field--choose Grid-cell">

                            <legend class="Form-legend">{$data_map.useful.contentclass_attribute_name|wash()}</legend>

                            <label class="Form-label Form-label--block u-color-black" for="utilita1">
                                <input class="Form-input" id="utilita1" type="radio" value="0"
                                       name="ContentObjectAttribute_ezselect_selected_array_{$data_map.useful.id}[]"/>
                                <span class="Form-fieldIcon" role="presentation"></span> per nulla
                            </label>

                            <label class="Form-label Form-label--block u-color-black" for="utilita2">
                                <input class="Form-input" id="utilita2" type="radio" value="1"
                                       name="ContentObjectAttribute_ezselect_selected_array_{$data_map.useful.id}[]"/>
                                <span class="Form-fieldIcon" role="presentation"></span> poco
                            </label>

                            <label class="Form-label Form-label--block u-color-black" for="utilita3">
                                <input class="Form-input" id="utilita3" type="radio" value="2"
                                       name="ContentObjectAttribute_ezselect_selected_array_{$data_map.useful.id}[]"/>
                                <span class="Form-fieldIcon" role="presentation"></span> abbastanza
                            </label>
                            <label class="Form-label Form-label--block u-color-black" for="utilita4">
                                <input class="Form-input" id="utilita4" type="radio" value="3"
                                       name="ContentObjectAttribute_ezselect_selected_array_{$data_map.useful.id}[]"/>
                                <span class="Form-fieldIcon" role="presentation"></span> molto
                            </label>

                        </fieldset>
                    {/if}

                    {if is_set( $data_map.easy )}
                        <input type="hidden" value=""
                               name="ContentObjectAttribute_ezselect_selected_array_{$data_map.easy.id}"/>
                        <fieldset class="Form-field Form-field--choose Grid-cell">

                            <legend class="Form-legend">{$data_map.easy.contentclass_attribute_name|wash()}</legend>

                            <label class="Form-label Form-label--block u-color-black" for="semplicita1">
                                <input class="Form-input" id="semplicita1" type="radio" value="0"
                                       name="ContentObjectAttribute_ezselect_selected_array_{$data_map.easy.id}[]"/>
                                <span class="Form-fieldIcon" role="presentation"></span> per nulla
                            </label>

                            <label class="Form-label Form-label--block u-color-black" for="semplicita2">
                                <input class="Form-input" id="semplicita2" type="radio" value="1"
                                       name="ContentObjectAttribute_ezselect_selected_array_{$data_map.easy.id}[]"/>
                                <span class="Form-fieldIcon" role="presentation"></span> poco
                            </label>

                            <label class="Form-label Form-label--block u-color-black" for="semplicita3">
                                <input class="Form-input" id="semplicita3" type="radio" value="2"
                                       name="ContentObjectAttribute_ezselect_selected_array_{$data_map.easy.id}[]"/>
                                <span class="Form-fieldIcon" role="presentation"></span> abbastanza
                            </label>

                            <label class="Form-label Form-label--block u-color-black" for="semplicita4">
                                <input class="Form-input" id="semplicita4" type="radio" value="3"
                                       name="ContentObjectAttribute_ezselect_selected_array_{$data_map.easy.id}[]"/>
                                <span class="Form-fieldIcon" role="presentation"></span> molto
                            </label>
                        </fieldset>
                    {/if}

                </div>

                <div class="Grid-cell u-md-size4of12 u-lg-size4of12 u-md-before1of12 u-lg-before1of12">
                    {if is_set( $data_map.comment )}
                        <div class="Form-field">
                            <label class="Form-label"
                                   for="helpcomment">{$data_map.comment.contentclass_attribute_name|wash()}</label>
                            <textarea style="height: 100px" id="helpcomment" class="Form-input"
                                      name="ContentObjectAttribute_ezstring_data_text_{$data_map.comment.id}" cols="20"
                                      rows="4"></textarea>
                        </div>
                    {/if}

                    {if is_set( $data_map.email_aiutaci )}
                        <div class="Form-field">
                            <label class="Form-label" for="helpemail_aiutaci"
                            >{$data_map.email_aiutaci.contentclass_attribute_name|wash()}</label>
                            <input id="helpemail_aiutaci" class="Form-input" type="text" value=""
                                   name="ContentObjectAttribute_ezstring_data_text_{$data_map.email_aiutaci.id}"/>
                        </div>
                    {/if}

                    {if is_set($data_map.antispam)}
                        {if $data_map.antispam.data_type_string|eq('ocrecaptcha')}
                            <div class="Form-field">
                                <label class="Form-label"
                                       for="helpcomment">{$data_map.antispam.contentclass_attribute_name|wash()}</label>
                                {attribute_view_gui attribute=$data_map.antispam}
                            </div>
                        {else}
                            {*                        {ezcss_require( array( 'nxc.captcha.css' ) )}*}
                            <link rel="stylesheet" href="{'stylesheets/nxc.captcha.css'|ezdesign(no)}"
                                  property='stylesheet'/>
                            {ezscript_require( array( 'nxc.captcha.js' ) )}

                            {def $attribute = $data_map.antispam $class_content = $attribute.contentclass_attribute.content $regenerate = 1}
                            {if ezhttp( 'ActionCollectInformation', 'post', true() )}
                                {set $regenerate = 0}
                            {/if}

                            {if eq( $attribute.data_int, 1 )}
                                <div class="Form-field">
                                    <label class="Form-label" for="nxc-captcha-collection-input-{$attribute.id}">Antispam</label>

                                    <p class="text-center u-padding-all-xxl">
                                        <img id="nxc-captcha-{$attribute.id}"
                                             alt="{'Secure code'|i18n( 'extension/nxc_captcha' )}"
                                             title="{'Secure code'|i18n( 'extension/nxc_captcha' )}"
                                             src="{concat( 'nxc_captcha/get/', $attribute.contentclass_attribute.id, '/nxc_captcha_collection_attribute_', $attribute.id, '/', $regenerate )|ezurl( 'no' )}"/>
                                        <a href="{concat( 'nxc_captcha/get/', $attribute.contentclass_attribute.id, '/nxc_captcha_collection_attribute_', $attribute.id, '/1' )|ezurl( 'no' )}"
                                           style="display: inline-block; vertical-align: super; padding: 0px 5px;"
                                           class="nxc-captcha-regenerate u-color-white"
                                           id="nxc-captcha-regenerate-{$attribute.id}">
                                            <i class="fa fa-repeat fa-2x"></i>
                                        </a>
                                    </p>

                                    <p class="u-padding-bottom-l">
                                        <input class="captcha-input Form-input"
                                               id="nxc-captcha-collection-input-{$attribute.id}" type="text"
                                               name="nxc_captcha_{$attribute.id}" value=""
                                               size="{$class_content.length.value}"
                                               placeholder="Inserisci qui il codice"
                                               maxlength="{$class_content.length.value}"/>
                                    </p>
                                    <span>Inserisci il codice di sicurezza che vedi nell'immagine per proteggere il sito dallo spam </span>

                                </div>
                            {else}
                                {*<p>{'Secure code is allready entered'|i18n( 'extension/nxc_captcha' )}</p>*}
                                <input type="hidden" name="nxc_captcha_{$attribute.id}" value=""/>
                            {/if}
                            {undef $attribute $class_content $regenerate}
                        {/if}
                    {/if}

                    <input class="box" type="hidden"
                           value="Nodo: {$node.node_id}; Oggetto:{$node.contentobject_id}; Versione: {$node.contentobject_version}; Titolo: {$node.name|wash()}"
                           name="ContentObjectAttribute_ezstring_data_text_{$data_map.nodo.id}"/>
                    <input class="box" type="hidden" value="{$node.url_alias|ezurl(no,full)}"
                           name="ContentObjectAttribute_ezstring_data_text_{$data_map.link.id}"/>
                    <input type="hidden" value="{$valutazione.main_node.node_id}" name="TopLevelNode"/>
                    <input type="hidden" value="{$valutazione.main_node.node_id}" name="ContentNodeID"/>
                    <input type="hidden" value="{$valutazione.id}" name="ContentObjectID"/>
                    <input type="hidden" name="ViewMode" value="full"/>
                    <input class="Button Button--default pull-right" type="submit" value="Invia la valutazione"
                           name="ActionCollectInformation"/>

                </div>
            </div>
        </form>

    </div>
{/if}
