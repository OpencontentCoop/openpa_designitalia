<ul>
    {if is_set($pagedata.contacts.telefono)}
        <li>
            {def $tel = strReplace($pagedata.contacts.telefono,array(" ",""))}
            {*        <a href="tel:{$pagedata.contacts.telefono}">*}
            <i class="fa fa-phone-square u-textClean"></i>
            <a class="u-linkClean" href="tel:{$tel}">
                {$pagedata.contacts.telefono}
            </a>
        </li>
    {/if}
    {if is_set($pagedata.contacts.fax)}
        <li>
            {def $fax = strReplace($pagedata.contacts.fax,array(" ",""))}
            {*      <a href="tel:{$pagedata.contacts.fax}">*}
            <i class="fa fa-fax u-textClean"></i>
            <a class="u-linkClean" href="tel:{$fax}">
                {$pagedata.contacts.fax}
            </a>
        </li>
    {/if}
    {if is_set($pagedata.contacts.email)}
        <li><i class="fa fa-envelope-o u-textClean"></i>
            <a class="u-linkClean" href="mailto:{$pagedata.contacts.email}">
                {$pagedata.contacts.email}
            </a></li>
    {/if}
    {if is_set($pagedata.contacts.pec)}
        <li><i class="fa fa-envelope u-textClean"></i>
            <a class="u-linkClean" href="mailto:{$pagedata.contacts.pec}">
                 {$pagedata.contacts.pec}
            </a></li>
    {/if}
    {if is_set($pagedata.contacts.web)}
        <li><i class="fa fa-link u-textClean"></i>
            <a class="u-linkClean" href="{$pagedata.contacts.web}">
                 {def $pnkParts = $pagedata.contacts.web|explode('//')}{if is_set( $pnkParts[1] )}{$pnkParts[1]}{/if}
            </a></li>
    {/if}
</ul>
