<form action={concat($module.functions.edit.uri,"/",$userID)|ezurl} method="post" name="Edit">

    <div class="user-edit">

        <h1 class='u-text-h2 u-padding-bottom-m'>{"User profile"|i18n("design/ocbootstrap/user/edit")}</h1>

        <div class="Grid">
            <div class="Grid-cell u-md-size1of2 u-lg-size1of2">


                <div class="Prose">
                    <strong>{"Username"|i18n("design/ocbootstrap/user/edit")}</strong>
                    {$userAccount.login|wash}
                </div>

                <div class="Prose">
                    <strong>{"Email"|i18n("design/ocbootstrap/user/edit")}</strong>
                    {$userAccount.email|wash(email)}
                </div>

                <div class="Prose">
                    <strong>{"Name"|i18n("design/ocbootstrap/user/edit")}</strong>
                    {$userAccount.contentobject.name|wash}
                </div>

            </div>
            <div class="Grid-cell u-md-size1of2 u-lg-size1of2">

                {if fetch( 'user', 'has_access_to', hash( 'module', 'content', 'function', 'edit' ) )}
                    <p class="Prose"><a href={"content/draft"|ezurl}>{"My drafts"|i18n("design/ocbootstrap/user/edit")}</a></p>
                {/if}
                {if fetch( 'user', 'has_access_to', hash( 'module', 'shop', 'function', 'administrate' ) )}
                    <p class="Prose">
                        <a href={concat("/shop/customerorderview/", $userID, "/", $userAccount.email)|ezurl}>{"My orders"|i18n("design/ocbootstrap/user/edit")}</a>
                    </p>
                {/if}
                {if fetch( 'user', 'has_access_to', hash( 'module', 'content', 'function', 'pendinglist' ) )}
                    <p class="Prose">
                        <a href={"/content/pendinglist"|ezurl}>{"My pending items"|i18n("design/ocbootstrap/user/edit")}</a>
                    </p>
                {/if}
                {if fetch( 'user', 'has_access_to', hash( 'module', 'notification', 'function', 'use' ) )}
                    <p class="Prose">
                        <a href={"notification/settings"|ezurl}>{"My notification settings"|i18n("design/ocbootstrap/user/edit")}</a>
                    </p>
                {/if}
                {if fetch( 'user', 'has_access_to', hash( 'module', 'shop', 'function', 'buy' ) )}
                    <p class="Prose"><a href={"/shop/wishlist"|ezurl}>{"My wish list"|i18n("design/ocbootstrap/user/edit")}</a></p>
                {/if}


            </div>
        </div>

        <div class="u-textCenter u-padding-all-xxl">
          <input class="button" type="submit" name="EditButton"
                 value="{'Edit profile'|i18n('design/ocbootstrap/user/edit')}"/>

          {if ezmodule( 'userpaex' )}
            <a class="Button Button--default" href="{concat("userpaex/password/",$userID)|ezurl(no)}">{'Change password'|i18n('design/ocbootstrap/user/edit')}</a>
          {else}
            <input class="Button Button--default" type="submit" name="ChangePasswordButton" value="{'Change password'|i18n('design/ocbootstrap/user/edit')}"/>
          {/if}
        </div>

    </div>

</form>
