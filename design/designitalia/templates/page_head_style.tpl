{if is_unset( $load_css_file_list )}
    {def $load_css_file_list = true()}
{/if}

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">

{if $load_css_file_list}
{ezcss_load( array(
        'vendor.css',
        'build.css',
        'debug.css',
        'websitetoolbar.css',
        ezini( 'StylesheetSettings', 'CSSFileList', 'design.ini' ),
        ezini( 'StylesheetSettings', 'FrontendCSSFileList', 'design.ini' )
    ),
    'all', 'text/css', 'stylesheet' )}
{else}
{ezcss_load( array(
        'vendor.css',
        'build.css',
        'debug.css',
        'websitetoolbar.css'
    ),
    'all', 'text/css', 'stylesheet' )}
{/if}

