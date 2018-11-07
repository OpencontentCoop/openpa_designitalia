<div class="Footer-subBlock">
    <ul class="Footer-socialIcons">
        {if is_set($pagedata.contacts.facebook)}
            <li style="margin: 1.8rem !important; padding: 0 !important;">
                <a href="{$pagedata.contacts.facebook}">
                                    <span class="openpa-icon fa-stack">
                                        <i class="fa fa-circle fa-stack-2x"></i>
                                        <i class="fa fa-facebook fa-stack-1x u-color-grey-80"
                                           aria-hidden="true"></i>
                                    </span>
                    <span class="u-hiddenVisually">Facebook</span>
                </a>
            </li>
        {/if}
        {if is_set($pagedata.contacts.twitter)}
            <li style="margin: 1.8rem !important; padding: 0 !important;">
                <a href="{$pagedata.contacts.twitter}">
                                    <span class="openpa-icon fa-stack">
                                        <i class="fa fa-circle fa-stack-2x"></i>
                                        <i class="fa fa-twitter fa-stack-1x u-color-grey-80" aria-hidden="true"></i>
                                    </span>
                    <span class="u-hiddenVisually">Twitter</span>
                </a>
            </li>
        {/if}
        {if is_set($pagedata.contacts.linkedin)}
            <li style="margin: 1.8rem !important; padding: 0 !important;">
                <a href="{$pagedata.contacts.linkedin}">
                                    <span class="openpa-icon fa-stack">
                                        <i class="fa fa-circle fa-stack-2x"></i>
                                        <i class="fa fa-linkedin fa-stack-1x u-color-grey-80"
                                           aria-hidden="true"></i>
                                    </span>
                    <span class="u-hiddenVisually">Linkedin</span>
                </a>
            </li>
        {/if}
        {if is_set($pagedata.contacts.instagram)}
            <li style="margin: 1.8rem !important; padding: 0 !important;">
                <a href="{$pagedata.contacts.instagram}">
                                    <span class="openpa-icon fa-stack">
                                        <i class="fa fa-circle fa-stack-2x"></i>
                                        <i class="fa fa-instagram fa-stack-1x u-color-grey-80"
                                           aria-hidden="true"></i>
                                    </span>
                    <span class="u-hiddenVisually">Instagram</span>
                </a>
            </li>
        {/if}
        {if is_set($pagedata.contacts.newsletter)}
            <li style="margin: 1.8rem !important; padding: 0 !important;">
                <a href="{$pagedata.contacts.newsletter}">
                    <span class="openpa-icon fa-stack">
                        <i class="fa fa-circle fa-stack-2x u-color-80"></i>
                        <i class="fa fa-envelope-square fa-stack-1x u-color-white" aria-hidden="true"></i>
                    </span>
                    <span class="u-hiddenVisually">Newsletter</span>
                </a>
            </li>
        {/if}
        {if is_set($pagedata.contacts.youtube)}
            <li style="margin: 1.8rem !important; padding: 0 !important;">
                <a href="{$pagedata.contacts.youtube}">
                <span class="openpa-icon fa-stack">
                    <i class="fa fa-circle fa-stack-2x u-color-80"></i>
                    <i class="fa fa-youtube fa-stack-1x u-color-white" aria-hidden="true"></i>
                </span>
                    <span class="u-hiddenVisually">YouTube</span>
                </a>
            </li>
        {/if}
        {def $forms = fetch( 'content', 'class', hash( 'class_id', 'feedback_form' ) ).object_list
        $form = cond(is_set($forms[0]), $forms[0], false())}
        {if $form}
            <li style="margin: 1.8rem !important; padding: 0 !important;">
                <a href="{$form.main_node.url_alias|ezurl(no)}">
                                    <span class="openpa-icon fa-stack">
                                        <i class="fa fa-circle fa-stack-2x"></i>
                                        <i class="fa fa-envelope fa-stack-1x u-color-grey-80"
                                           aria-hidden="true"></i>
                                    </span>
                    <span class="u-hiddenVisually">Richiedi informazioni</span>
                </a>
            </li>
        {/if}
        {undef $forms $form}
    </ul>
</div>
