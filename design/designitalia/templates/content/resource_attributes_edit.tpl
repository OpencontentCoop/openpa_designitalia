<div class="u-padding-all-s">
    {def $other_attributes = array()
         $number = 0}
    {foreach $resource_attributes as $attribute}
        {def $identifier = $attribute.contentclass_attribute_identifier
             $parts = $identifier|explode( '_' )}
            {switch match=$parts[2]}
            {case match='url'}
                {def $url = $attribute}
            {/case}
            {case match='file'}
                {def $file = $attribute}
            {/case}
            {case match='api'}
                {def $api = $attribute}
            {/case}
            {case}
                {set $other_attributes = $other_attributes|append( $attribute )}
                {set $number = $parts[1]}
            {/case}
            {/switch}

        {undef $identifier $parts}
    {/foreach}

    <fieldset class="Form-field">
        <legend class="Form-label ">
            Risorsa {$number}
        </legend>


        <div class="resource-tab">

            {foreach $other_attributes as $a}
            <div class="row edit-row">
                <div class="col-md-3">{$a.contentclass_attribute.name|wash}</div>
                <div class="col-md-9">
                    {if $a.contentclass_attribute.description}
                        <p><em class="classattribute-description">{first_set( $a.contentclass_attribute.descriptionList[$content_language], $a.contentclass_attribute.description)|wash}</em></p>
                    {/if}
                    {attribute_edit_gui attribute_base=$attribute_base attribute=$a view_parameters=$view_parameters html_class='Form-input'}
                </div>
            </div>
            {/foreach}

            <div class="row edit-row">
                <div class="col-md-3">
                    Sorgente<br />
                    <em><span class="classattribute-description"><small>Utilizza solo una sorgente</small></span></em>
                </div>
                <div class="col-md-9">

                    <div id="coa-{$url.id}" class="resource-panel edit-row{if $url.has_content} has_content active{/if}">
                        <label>{$url.contentclass_attribute.name|wash}</label>
                        <p>
                            <input class="form-control" type="text" size="70" name="{$attribute_base}_ezurl_url_{$url.id}" value="{$url.content|wash( xhtml )}" />
                            <input type="hidden" name="{$attribute_base}_ezurl_text_{$url.id}" value="{$url.data_text|wash( xhtml )}" />
                        </p>
                    </div>

                    <div id="coa-{$file.id}" class="resource-panel edit-row{if $file.has_content} has_content active{/if}">
                        <label>{$file.contentclass_attribute.name|wash}</label>
                        <p>
                            {if $file.content}
                                {$file.content.original_filename|wash( xhtml )}
                                <input class="button" type="submit" name="CustomActionButton[{$file.id}_delete_binary]" value="{'Remove'|i18n( 'design/standard/content/datatype' )}" title="{'Remove the file from this draft.'|i18n( 'design/standard/content/datatype' )}" />
                            {/if}
                            <input type="hidden" name="MAX_FILE_SIZE" value="{$file.contentclass_attribute.data_int1}000000"/>
                            <input class="inputfile" type="file" name="{$attribute_base}_data_binaryfilename_{$file.id}"  />
                        </p>
                    </div>

                    <div id="coa-{$api.id}" class="resource-panel edit-row{if $api.has_content} has_content active{/if}">
                        <label>{$api.contentclass_attribute.name|wash}</label>
                        <p>
                            <input class="form-control" type="text" size="70" name="{$attribute_base}_ezurl_url_{$api.id}" value="{$api.content|wash( xhtml )}" />
                            <input type="hidden" name="{$attribute_base}_ezurl_text_{$api.id}" value="{$api.data_text|wash( xhtml )}" />
                        </p>
                    </div>

                </div>
            </div>
        </div>

    </fieldset>
</div>