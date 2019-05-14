<table width="100%"  cellspacing="0" cellpadding="0" border="0" class="table list">
  <tbody>

  <tr id="default_filter">
    <td style="vertical-align: middle;width: 20%; background-color: #efefef; font-weight: bold">
      Filtro di default
    </td>
    <td>
      <div class="radio">
        <label>
          <input type="radio" class="default_filter" name="extra_handler_{$handler.identifier}[class][{$class.identifier}][default_filter]"
                 value="today" {if $handler.default_filter|contains("today")}checked="checked"{/if} /> Oggi
        </label>
      </div>
    </td>
    <td>
      <div class="radio">
        <label>
          <input type="radio" class="default_filter" name="extra_handler_{$handler.identifier}[class][{$class.identifier}][default_filter]"
                 value="weekend" {if $handler.default_filter|contains("weekend")}checked="checked"{/if} /> Questa settimana
        </label>
      </div>
    </td>
    <td>
      <div class="radio">
        <label>
          <input type="radio" class="default_filter" name="extra_handler_{$handler.identifier}[class][{$class.identifier}][default_filter]"
                 value="month" {if $handler.default_filter|contains("month")}checked="checked"{/if} /> Questo mese
        </label>
      </div>
    </td>
    <td>
      <div class="radio">
        <label>
          <input type="radio" class="default_filter" name="extra_handler_{$handler.identifier}[class][{$class.identifier}][default_filter]"
                 value="next 7 days" {if $handler.default_filter|contains("next 7 days")}checked="checked"{/if} /> I prossimi 7
          giorni
        </label>
      </div>
    </td>
    <td>
      <div class="radio">
        <label>
          <input type="radio" class="default_filter" name="extra_handler_{$handler.identifier}[class][{$class.identifier}][default_filter]"
                 value="next 30 days" {if $handler.default_filter|contains("next 30 days")}checked="checked"{/if} /> I prossimi
          30 giorni
        </label>
      </div>
    </td>
    <td>
      <div class="radio">
        <label>
          <input type="radio" class="default_filter"  name="extra_handler_{$handler.identifier}[class][{$class.identifier}][default_filter]"
                 value="all" {if $handler.default_filter|contains("all")}checked="checked"{/if} /> Tuttti
        </label>
      </div>
    </td>
  </tr>

  <tr id="filters">
    <td style="vertical-align: middle;width: 20%; background-color: #efefef; font-weight: bold"">
      Filtri disponibili
    </td>
    <td>
      <div class="checkbox">
        <label>
          <input type="checkbox" class="filters" name="extra_handler_{$handler.identifier}[class][{$class.identifier}][filters][]"
                 value="today" {if $handler.filters|contains("today")}checked="checked"{/if} /> Oggi
        </label>
      </div>
    </td>
    <td>
      <div class="checkbox">
        <label>
          <input type="checkbox" class="filters" name="extra_handler_{$handler.identifier}[class][{$class.identifier}][filters][]"
                 value="weekend" {if $handler.filters|contains("weekend")}checked="checked"{/if} /> Questa settimana
        </label>
      </div>
    </td>
    <td>
      <div class="checkbox">
        <label>
          <input type="checkbox" class="filters" name="extra_handler_{$handler.identifier}[class][{$class.identifier}][filters][]"
                 value="month" {if $handler.filters|contains("month")}checked="checked"{/if} /> Questo mese
        </label>
      </div>
    </td>
    <td>
      <div class="checkbox">
        <label>
          <input type="checkbox" class="filters" name="extra_handler_{$handler.identifier}[class][{$class.identifier}][filters][]"
                 value="next 7 days" {if $handler.filters|contains("next 7 days")}checked="checked"{/if} /> I prossimi 7
          giorni
        </label>
      </div>
    </td>
    <td>
      <div class="checkbox">
        <label>
          <input type="checkbox" class="filters" name="extra_handler_{$handler.identifier}[class][{$class.identifier}][filters][]"
                 value="next 30 days" {if $handler.filters|contains("next 30 days")}checked="checked"{/if} /> I prossimi
          30 giorni
        </label>
      </div>
    </td>
    <td>
      <div class="checkbox">
        <label>
          <input type="checkbox" class="filters" name="extra_handler_{$handler.identifier}[class][{$class.identifier}][filters][]"
                 value="all" {if $handler.filters|contains("all")}checked="checked"{/if} /> Tutti
        </label>
      </div>
    </td>
  </tr>
  </tbody>
</table>

<table width="100%"  cellspacing="0" cellpadding="0" border="0" class="table list">
  <tbody>
  <tr id="min_time">
    <td style="vertical-align: middle;width: 20%; background-color: #efefef; font-weight: bold"">
      Ora minima<br />
      <small>Determina la prima fascia oraria che verrà visualizzata per ogni giorno</small>
    </td>
    <td>
      <input type='time' id="min_time" class="form-control" name="extra_handler_{$handler.identifier}[class][{$class.identifier}][min_time]" value="{$handler.min_time}" />
    </td>
  </tr>
  <tr id="max_time">
    <td style="vertical-align: middle;width: 20%; background-color: #efefef; font-weight: bold"">
    Ora massima<br />
    <small>Determina l'ultima fascia oraria che verrà visualizzata per ogni giorno</small>
    </td>
    <td>
      <input type='time' class="form-control" name="extra_handler_{$handler.identifier}[class][{$class.identifier}][max_time]" value="{$handler.max_time}" />
    </td>
  </tr>
  </tbody>
</table>



{literal}
  <script>
    $( document ).ready(function() {

      $('input[type=radio].default_filter').change(function() {

        $('input[type=checkbox].filters').removeAttr('readonly');
        $('input[type=checkbox][value="'+ $(this).val() +'"]').attr('checked', 'checked');
      });


      $('input[type=checkbox].filters').click(function(e) {
        if (!$(this).is(':checked')) {
          if ($('input[type=radio][value="'+ $(this).val() +'"]').is(':checked')) {
            alert("Azione non consentita, devi prima selezionare un altro filtro di default!");
            return false;
          }
        }
        return true;
      });

      /*tail.DateTime("#min_time");*/

    });
  </script>
{/literal}
