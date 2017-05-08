{def $fields = $openpa.control_children.current_extra_configs}
{if is_set($fields.chart)}

    <div class="chart-render"></div>

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
            var chartRender = $('.chart-render');
            var data = [
                ['',1,3],
                [1,5,7]
            ];
            var instance = new ec({data: data});
            instance.setConfigStringified({/literal}'{$fields.chart.chart}'{literal});
            var options = instance.getConfigAndData();
            options.chart.renderTo = chartRender[0];
            var chart = new Highcharts.Chart(options);

        });
        {/literal}</script>

{/if}
{undef $fields}
