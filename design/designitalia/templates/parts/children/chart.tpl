{def $fields = $openpa.control_children.current_extra_configs}
{if is_set($fields.chart)}

    <div class="chart-render">
        <p class="text-center"><i class="fa fa-spinner fa-spin fa-3x fa-fw"></i></p>
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

    {def $root_nodes = array($node.node_id)}
    {if is_set( $openpa.content_virtual.folder.subtree )}
        {set $root_nodes = $openpa.content_virtual.folder.subtree}
    {/if}

    <script>{literal}
        $(document).ready(function(){
            var chartRender = $('.chart-render');
            var easyChart = new ec({
                dataUrl:"{/literal}{'/openpa/data/chart?params='|ezurl(no)}{$fields.chart.fields}&subtree[]={$root_nodes|implode('&subtree[]=')}{literal}"
            });
            easyChart.setConfigStringified({/literal}'{$fields.chart.chart}'{literal});
            easyChart.on('dataUpdate', function(e){
                var options = easyChart.getConfigAndData();
                options.chart.renderTo = chartRender[0];
                var chart = new Highcharts.Chart(options);
            });
        });
        {/literal}</script>

{/if}
{undef $fields}
