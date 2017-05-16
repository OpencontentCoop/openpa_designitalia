<div class="openpa-full">
  <div class="title">
    <h1>{"Notification settings"|i18n('design/standard/notification')}</h1>
  </div>
  <div class="content-container">
    <div class="content">
      <form method="post" class="Form Form--spaced u-text-r-xs" action={"/notification/settings/"|ezurl}>
          {let handlers=fetch('notification','handler_list')}
              {section name=Handlers loop=$handlers}
              {*Handler: {$Handlers:item.name}*}
                  {include handler=$Handlers:item uri=concat( "design:notification/handler/",$Handlers:item.id_string,"/settings/edit.tpl")}
                  {delimiter}<br/>{/delimiter}
              {/section}
          {/let}

          <div class="u-margin-top-m u-textRight">
              <input class="button" type="submit" name="Store" value="{'Store'|i18n('design/standard/notification')}" />
          </div>
      </form>
    </div>
  </div>
</div>
