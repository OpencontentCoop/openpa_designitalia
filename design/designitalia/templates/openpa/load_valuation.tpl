{if is_set($parameters)}
<script>{literal}
    $(document).ready(function(){
        $('#toggle-validation').on('click', function (e) {
            var container = $('#openpa-valuation');
            if (container.data('loaded') === 0){
                container.load($.ez.url+'call/openpaajax::loadValuation::{/literal}{$parameters}{literal}', null, function(response){
                    container.data('loaded', 1);
                    container.show();
                    e.preventDefault();
                });
            }else{
                container.toggle();
            }
            e.preventDefault();
        });
    });
{/literal}</script>
{/if}