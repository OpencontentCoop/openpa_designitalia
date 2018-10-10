<div class="content-related">

  {if $contact_points|count()|gt(0)}
    {def $sites = array()}
    {foreach $contact_points as $contact_point}
      {def $search_reverse_related = fetch('ezfind','search', hash('limit',20,'filter',array(concat("sede/has_contact_point/id:",$contact_point.object.id))))
           $objects = $search_reverse_related.SearchResult
           $objects_count = $search_reverse_related.SearchCount}

      {if $objects_count|gt(0)}
        {foreach $objects as $object}
          {if $object.can_read}
            {set $sites = $sites|append($object)}
          {/if}
        {/foreach}
      {/if}
    {/foreach}


    {if $sites|count()|gt(0)}
      <div class="openpa-widget nav-section">
        <h3 class="openpa-widget-title"><span><i class="fa fa-magic" aria-hidden="true"></i> Dove</span></h3>
        <div class="openpa-widget-content">
          <ul>
            {foreach $sites as $s}
              <li><a href="{$s.url_alias|ezurl(no)}">{$s.name}</a></li>
            {/foreach}
          </ul>
        </div>
      </div>
    {/if}
  {/if}

</div>
