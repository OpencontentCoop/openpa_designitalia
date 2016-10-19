{set-block scope=root variable=cache_ttl}0{/set-block}

<div class="openpa-full class-{$node.class_identifier}">

    <div class="title">
        {include uri='design:openpa/full/parts/node_languages.tpl'}
        <h2>{$node.name|wash()}</h2>
    </div>

    <div class="content-container">
        <div class="content">

            {def $name_pattern = $node.object.content_class.contentobject_name|explode('>')|implode(',')
                 $name_pattern_array = array('enable_comments', 'enable_tipafriend', 'show_children', 'show_children_exclude', 'show_children_pr_page')
                 $exclude_datatypes = array('ezoption', 'ezmultioption', 'ezmultioption2', 'ezrangeoption', 'ezprice', 'ezmultiprice')}
            {set $name_pattern  = $name_pattern|explode('|')|implode(',')}
            {set $name_pattern  = $name_pattern|explode('<')|implode(',')}
            {set $name_pattern  = $name_pattern|explode(',')}
            {foreach $name_pattern  as $name_pattern_string}
                {set $name_pattern_array = $name_pattern_array|append( $name_pattern_string|trim() )}
            {/foreach}

            {foreach $node.object.contentobject_attributes as $attribute}
                {if and($name_pattern_array|contains($attribute.contentclass_attribute_identifier)|not(),
                        $exclude_datatypes|contains($attribute.data_type_string)|not)}
                    <div class="attribute-{$attribute.contentclass_attribute_identifier}">
                        {attribute_view_gui attribute=$attribute}
                    </div>
                {/if}
            {/foreach}

            {def $tipafriend_access=fetch( 'user', 'has_access_to', hash( 'module', 'content',
                                                                          'function', 'tipafriend' ) )}
            {if and( ezmodule( 'content/tipafriend' ), $tipafriend_access )}
            <div class="attribute-tipafriend">
                <p><a href={concat( "/content/tipafriend/", $node.node_id )|ezurl} title="{'Tip a friend'|i18n( 'design/ezwebin/full/article' )}">{'Tip a friend'|i18n( 'design/ezwebin/full/article' )}</a></p>
            </div>
            {/if}
        </div>
    </div>
</div>
