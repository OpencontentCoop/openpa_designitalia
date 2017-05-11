<div class="Form-field {$view.identifier} u-background-white u-padding-all-xs" id="openpachildrenview_extra-{$attribute.id}-{$view.identifier}">
    <label class="Form-label" for="openpachildrenview_option-{$attribute.id}-{$view.identifier}">
        {'Opzioni'|i18n( 'design/admin/content/edit_attribute' )} {$view.name|wash()}
    </label>
    <em class="attribute-description">{$view.edit_template_help|wash()}</em>

    <input class="Form-input chart-fields"
           id="openpachildrenview_option-{$attribute.id}-{$view.identifier}"
           type="text"
           size="70"
           name="{$attribute_base}_openpachildrenview_extra_{$attribute.id}[{$view.identifier}][fields]"
           value="{cond(is_set($extra_configs[$view.identifier]['fields']), $extra_configs[$view.identifier]['fields']|wash(), '')}" >

    <input class="Form-input chart-data"
           id="openpachildrenview_option-{$attribute.id}-{$view.identifier}"
           type="hidden"
           size="70"
           name="{$attribute_base}_openpachildrenview_extra_{$attribute.id}[{$view.identifier}][chart]"
           value="{cond(is_set($extra_configs[$view.identifier]['chart']), $extra_configs[$view.identifier]['chart']|wash(), '')}" >

    {*<p class="u-padding-all-xs"><a class="toggle-editor">Mostra/nascondi editor del grafico</a></p>*}
    <div class="chart-editor" {*style="display: none"*}></div>
</div>

<script type="text/javascript" src="//code.highcharts.com/highcharts.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.highcharts.com/highcharts-3d.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.highcharts.com/highcharts-more.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.highcharts.com/modules/funnel.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.highcharts.com/modules/heatmap.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.highcharts.com/modules/solid-gauge.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.highcharts.com/modules/treemap.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.highcharts.com/modules/boost.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.highcharts.com/modules/exporting.js"></script>
<script type="text/javascript" src="//code.highcharts.com/modules/no-data-to-display.js"></script>
{ezscript_require(array('ezjsc::jquery','ec.min.js'))}
{ezcss_require(array('ec.css'))}

<script>{literal}
    $(document).ready(function(){
        var chartConfigContainer = $('#openpachildrenview_extra-{/literal}{$attribute.id}-{$view.identifier}{literal}');
        var chartEditor = chartConfigContainer.find('.chart-editor');
        var chartInput = chartConfigContainer.find('.chart-data');
        var chartRequest = chartConfigContainer.find('.chart-fields');
        chartConfigContainer.find('a.toggle-editor').on('click', function(){
            chartEditor.toggle();
        });
        var easyChart = new ec({
            debuggerTab: true,
            showLogo: false,
            element: chartEditor[0]
        });

        var refreshRequest = function(){
            var params = chartRequest.val();
            var subtree = "{/literal}{cond($attribute.object.main_node_id, $attribute.object.main_node_id, 0)}{literal}";
            var url = "{/literal}{'/openpa/data/chart?params='|ezurl(no)}{literal}"+params+"&subtree="+subtree;
            easyChart.setDataUrl(url);
        };
        chartRequest.on('change',function(e){
            refreshRequest();
        });
        if (chartInput.val()){
            easyChart.setConfigStringified(chartInput.val());
        }
        easyChart.on('configUpdate', function(e){
            chartInput.val(easyChart.getConfigStringified());
        });
        refreshRequest();
    });
{/literal}</script>
