<div class="Footer-subBlock">
  <ul class="Footer-socialIcons">
    {if is_set($pagedata.contacts.facebook)}
      <li>
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
      <li>
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
      <li>
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
      <li>
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

    {def $forms = fetch( 'content', 'class', hash( 'class_id', 'feedback_form' ) )
    $form = $forms.object_list[0]}
    {if $form}
      <li>
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
