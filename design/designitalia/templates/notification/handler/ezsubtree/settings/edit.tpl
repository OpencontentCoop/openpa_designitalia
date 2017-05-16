{let subscribed_nodes=$handler.rules}
  <fieldset class="Form-fieldset u-margin-top-m">
    <legend class="Form-legend">{"Node notification"|i18n("design/standard/notification")}</legend>

    <table class="Table Table--striped Table--hover Table--withBorder" width="100%">
        <tr>
            <th width="69%">
                {"Name"|i18n("design/standard/notification")}
            </th>
            <th width="30%">
                {"Class"|i18n("design/standard/notification")}
            </th>
            <th width="30%">
                {"Section"|i18n("design/standard/notification")}
            </th>
            <th width="1%">
                {"Select"|i18n("design/standard/notification")}
            </th>
        </tr>

        {section name=Rules loop=$subscribed_nodes sequence=array(bgdark,bglight)}
            <tr>

                <td class="{$Rules:sequence}">
                    <a href={concat("/content/view/full/",$Rules:item.node.node_id,"/")|ezurl}>
                        {$Rules:item.node.name|wash}
                    </a>
                </td>

                <td class="{$Rules:sequence}">
                    {$Rules:item.node.object.content_class.name|wash}
                </td>
                <td class="{$Rules:sequence}">
                    {$Rules:item.node.object.section_id}
                </td>

                <td class="{$Rules:sequence}">
                    <input type="checkbox" name="SelectedRuleIDArray_{$handler.id_string}[]" value="{$Rules:item.id}" />
                </td>


            </tr>
        {/section}
    </table>
    <div class="u-margin-top-s">
        <input class="button" type="submit" name="NewRule_{$handler.id_string}" value="{'New'|i18n('design/standard/notification')}" />
        <input class="button" type="submit" name="RemoveRule_{$handler.id_string}" value="{'Remove'|i18n('design/standard/notification')}" />
    </div>
  </fieldset>

{/let}
