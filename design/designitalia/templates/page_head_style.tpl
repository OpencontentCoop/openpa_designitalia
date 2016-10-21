{if is_unset( $load_css_file_list )}
    {def $load_css_file_list = true()}
{/if}

{if $load_css_file_list}
{ezcss_load( array(
        'vendor.css',
        'build.css',
        'ez.css',
        'debug.css',
        'font-awesome.min.css',
        'websitetoolbar.css',
        ezini( 'StylesheetSettings', 'CSSFileList', 'design.ini' ),
        ezini( 'StylesheetSettings', 'FrontendCSSFileList', 'design.ini' )
    ),
    'all', 'text/css', 'stylesheet' )}
{else}
{ezcss_load( array(
        'vendor.css',
        'build.css',
        'ez.css',
        'debug.css',
        'font-awesome.min.css',
        'websitetoolbar.css'
    ),
    'all', 'text/css', 'stylesheet' )}
{/if}

