<ul>
    {if is_set($contacts.indirizzo)}
        <li>
            <i class="fa fa-building u-textClean"></i>
            <a href="http://maps.google.com/maps?q={$contacts.indirizzo|urlencode}">
                {$contacts.indirizzo}
            </a>
        </li>
    {/if}

    {if is_set($contacts.telefono)}
        <li>
            {def $tel = strReplace($contacts.telefono,array(" ",""))}
            {*        <a href="tel:{$contacts.telefono}">*}
            <i class="fa fa-phone-square u-textClean"></i>
            <a class="u-linkClean" href="tel:{$tel}">
                {$contacts.telefono}
            </a>
        </li>
    {/if}
    {if is_set($contacts.fax)}
        <li>
            {def $fax = strReplace($contacts.fax,array(" ",""))}
            {*      <a href="tel:{$contacts.fax}">*}
            <i class="fa fa-fax u-textClean"></i>
            <a class="u-linkClean" href="tel:{$fax}">
                {$contacts.fax}
            </a>
        </li>
    {/if}
    {if is_set($contacts.email)}
        <li><i class="fa fa-envelope-o u-textClean"></i>
            <a class="u-linkClean" href="mailto:{$contacts.email}">
                {$contacts.email}
            </a></li>
    {/if}
    {if is_set($contacts.pec)}
        <li><i class="fa fa-envelope u-textClean"></i>
            <a class="u-linkClean" href="mailto:{$contacts.pec}">
                 {$contacts.pec}
            </a></li>
    {/if}
    {if is_set($contacts.web)}
        <li><i class="fa fa-link u-textClean"></i>
            <a class="u-linkClean" href="{$contacts.web}">
                 {def $pnkParts = $contacts.web|explode('//')}{if is_set( $pnkParts[1] )}{$pnkParts[1]}{/if}
            </a></li>
    {/if}
    {if is_set($contacts.partita_iva)}
        <li><i class="fa fa-code u-textClean"></i> P.IVA {$contacts.partita_iva}</li>
    {/if}
    {if is_set($contacts.codice_fiscale)}
        <li><i class="fa fa-code u-textClean"></i> C.F. {$contacts.codice_fiscale}</li>
    {/if}
</ul>