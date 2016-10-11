{if is_set($pagedata.contacts.telefono)}
<p>
    {def $tel = strReplace($pagedata.contacts.telefono,array(" ",""))}
{*        <a href="tel:{$pagedata.contacts.telefono}">*}
    <a href="tel:{$tel}">
        <i class="fa fa-phone-square"></i>
        {$pagedata.contacts.telefono}
    </a>
</p>
{/if}
{if is_set($pagedata.contacts.fax)}
<p>
  {def $fax = strReplace($pagedata.contacts.fax,array(" ",""))}
{*      <a href="tel:{$pagedata.contacts.fax}">*}
  <a href="tel:{$fax}">
    <i class="fa fa-fax"></i>
    {$pagedata.contacts.fax}
  </a>
</p>
{/if}
{if is_set($pagedata.contacts.email)}
<p><a href="mailto:{$pagedata.contacts.email}">
    <i class="fa fa-envelope-o"></i>
    {$pagedata.contacts.email}
  </a></p>
{/if}
{if is_set($pagedata.contacts.pec)}
<p><a href="mailto:{$pagedata.contacts.pec}">
    <i class="fa fa-envelope"></i>
    {$pagedata.contacts.pec}
  </a></p>
{/if}
{if is_set($pagedata.contacts.web)}
<p><a href="{$pagedata.contacts.web}">
    <i class="fa fa-pnk"></i>
    {def $pnkParts = $pagedata.contacts.web|explode('//')}
    {if is_set( $pnkParts[1] )}
      {$pnkParts[1]}
    {/if}
  </a></p>
{/if}
