{if is_set( $self.content_virtual.folder.classes )}
  {def $classes = fetch( 'class', 'list', hash( 'class_filter', $self.content_virtual.folder.classes ) )}
{else}
  {def $classes = fetch( 'ocbtools', 'children_classes', hash( 'parent_node_id', $node.node_id ) )}
{/if}
{def $root_nodes = array( $node.node_id )}
{if is_set( $self.content_virtual.folder.subtree )}
  {set $root_nodes = $self.content_virtual.folder.subtree}
{/if}

{def $class_identifiers = array()}
{def $attribute_identifiers = array()}
{def $text_identifiers = array()}
{foreach $classes as $index => $class}
  {set $class_identifiers = $class_identifiers|append($class.identifier)}
  {foreach $class.data_map as $identifier => $class_attribute}
    {if and(is_set($attribute_identifiers[$index])|not(), $class_attribute.data_type_string|eq('ezstring'))}
      {set $attribute_identifiers = $attribute_identifiers|append($identifier)}
    {/if}
    {if and(is_set($text_identifiers[$index])|not(), $class_attribute.data_type_string|eq('ezxmltext'))}
      {set $text_identifiers = $text_identifiers|append($identifier)}
    {/if}
  {/foreach}
{/foreach}


<div data-dictionary_subtree="{$root_nodes|implode(',')}"
     data-limit="20"
     data-dictionary_classes="{$class_identifiers|implode(',')}"
     data-dictionary_attributes="{$attribute_identifiers|implode(',')}"
     data-dictionary_texts="{$text_identifiers|implode(',')}">

  <form>
    <div class="Grid Grid--withGutter u-margin-bottom-l">
      <div class="Grid-cell u-size5of12">
        <label for="lemma-{$node.node_id}" class="sr-only"><small>Ricerca per lemma</small></label>
        <input type="text" class="form-control" id="lemma-{$node.node_id}" data-search="lemma" placeholder="Ricerca per lemma">
      </div>
      <div class="Grid-cell u-size5of12">
        <label for="search-{$node.node_id}" class="sr-only"><small>Ricerca libera</small></label>
        <input type="text" class="form-control" id="search-{$node.node_id}" data-search="q" placeholder="Ricerca libera">
      </div>
      <div class="col-md-2 text-center">
        <button type="submit" class="u-padding-all-xs">
          <i class="fa fa-search"></i>
        </button>
        <button type="reset" class="u-padding-all-xs hide">
          <i class="fa fa-times"></i>
        </button>
      </div>
    </div>
  </form>

  <div class="Grid Grid--withGutter">
    <div class="Grid-cell u-size2of12 u-size-md-1of12">
      <div class="Grid Grid--alignCenter u-padding-right-l">
        {foreach alphabet() as $letter}
          <div class="Grid-cell text-center">
            <button style="display: none" data-start_letter="{$letter|upcase|wash()}" class="Button Button--info u-text-r-xs u-padding-all-s u-margin-all-xxs" style="width: 100%;">{$letter|upcase()|wash()}</button>
          </div>
        {/foreach}
      </div>
    </div>
    <div class="Grid-cell u-size10of12 u-size-md-11of12 u-background-5 u-border-left-xxs results" style="position: relative;">
    </div>
  </div>
</div>
{ezscript_require(array('jquery.opendataTools.js', 'moment.js', 'jsrender.js'))}

{run-once}
{literal}
  <script id="tpl-dictionary-spinner" type="text/x-jsrender">
<div class="spinner text-center u-padding-all-xxl">
    <i class="fa fa-circle-o-notch fa-spin fa-3x fa-fw"></i>
    <span class="sr-only">Attendere il caricamento dei dati...</span>
</div>
</script>
  <script id="tpl-dictionary-results" type="text/x-jsrender">
	<div class="u-padding-all-m u-margin-left-m u-padding-bottom-xxl">
    {{if totalCount == 0}}
      <div class="col"><em>Nessun contenuto trovato</em></div>
    {{/if}}
    {{for searchHits}}
        <div class="Prose u-layout-prose">
          {{for attributes ~content=#data}}<h4 style="margin-bottom:0 !important">{{:~i18n(~content.data, #data)}}</h4>{{/for}}
          {{for texts ~content=#data}}{{if ~i18n(~content.data, #data)}}{{:~i18n(~content.data, #data)}}{{/if}}{{/for}}
        </div>
    {{/for}}
	</div>

	{{if pageCount > 1}}
      <div class="u-flex u-flexWrap u-sm-flexJustifyCenter u-md-flexJustifyCenter u-lg-flexJustifyCenter u-padding-top-l" style="position: absolute;bottom: 0;padding: 10px 0 !important;width: 100%;">
          <div class="FlexItem {{if !prevPageQuery}}disabled{{/if}}">
              <a class="page-link prevPage Button Button--info {{if !prevPageQuery}}is-disabled{{/if}}" {{if prevPageQuery}}data-page="{{>prevPage}}"{{/if}} href="#">
                  <span class="text">&laquo;</span>
              </a>
          </div>

          {{for pages ~current=currentPage}}
            <div class="FlexItem"><a href="#" class="page-link page Button Button--info {{if ~current == query}}is-disabled{{/if}}" data-page_number="{{:page}}" data-page="{{:query}}"{{if ~current == query}} data-current aria-current="page"{{/if}}>{{:page}}</a></div>
          {{/for}}

          <div class="FlexItem {{if !nextPageQuery}}disabled{{/if}}">
              <a class="page-link nextPage Button Button--info {{if !nextPageQuery}}is-disabled{{/if}}" {{if nextPageQuery}}data-page="{{>nextPage}}"{{/if}} href="#">
                  <span>&raquo;</span>
              </a>
          </div>
      </div>
	{{/if}}
</script>

  <script>
    $.views.helpers($.opendataTools.helpers);
    $(document).ready(function () {
      $('[data-dictionary_subtree]').each(function () {
        var baseUrl = '/';
        if (typeof (UriPrefix) !== 'undefined' && UriPrefix !== '/') {
          baseUrl = UriPrefix + '/';
        }
        var container = $(this);

        var resultsContainer = container.find('.results');
        var limitPagination = container.data('limit');
        var subtree = container.data('dictionary_subtree').toString().split(',');
        var classes = container.data('dictionary_classes').split(',');
        var attributes = container.data('dictionary_attributes').split(',');
        var texts = container.data('dictionary_texts').split(',');
        var currentPage = 0;
        var queryPerPage = [];
        var template = $.templates('#tpl-dictionary-results');
        var spinner = $($.templates("#tpl-dictionary-spinner").render({}));
        var isLoadedFacetsCount = false;

        var buildQuery = function () {
          var query = 'classes ['+ classes +'] subtree [' + subtree + '] facets [';
          $.each(attributes, function (index, attribute) {
            query += "raw[subattr_"+this + "___start_letter____s]|alpha";
            query += index === (attributes.length - 1) ? '' : ',';
          });
          query += ']';
          if (container.find('[data-search="lemma"]').length > 0) {
            var searchLemma = container.find('[data-search="lemma"]').val().replace(/"/g, '').replace(/'/g, "").replace(/\(/g, "").replace(/\)/g, "").replace(/\[/g, "").replace(/\]/g, "");
            if (searchLemma.length > 0) {
              query += " and ";
              if (attributes.length === 1) {
                query += "raw[attr_"+attributes[0] + "_t]" + " = '" + searchLemma + "'";
              } else {
                query += "(";
                $.each(attributes, function (index, attribute) {
                  query += "raw[attr_"+attribute + "_t]" + " = '" + searchLemma + "'";
                  query += attributes.length > 1 && index === (attributes.length - 1) ? ' or ' : '';
                });
                query += ")";
              }
            }
          }
          if (container.find('form').length > 0) {
            var searchText = container.find('[data-search="q"]').val().replace(/"/g, '').replace(/'/g, "").replace(/\(/g, "").replace(/\)/g, "").replace(/\[/g, "").replace(/\]/g, "");
            if (searchText.length > 0) {
              query += " and q = '" + searchText + "'";
            }
          }

          var startLetterFilters = [];
          container.find('[data-start_letter].Button--default').each(function(){
            startLetterFilters.push($(this).data('start_letter'));
          });
          if (startLetterFilters .length > 0){
            query += " and (";
            $.each(attributes, function (index, attribute) {
              query += "raw[subattr_"+this + "___start_letter____s] in [\"" + startLetterFilters .join('","') + "\"] or raw[subattr_"+this + "___start_letter____s] in [\"" + startLetterFilters .join('","').toLowerCase() + "\"]";
              query += attributes.length > 1 && index === (attributes.length - 1) ? ' or ' : '';
            });
            query += ") ";
          }

          query += ' sort [';
          $.each(attributes, function (index, attribute) {
            query += "raw[attr_"+attribute + "_t]=>asc";
            query += attributes.length > 1 && index === (attributes.length - 1) ? ',' : '';
          });
          query += ']';

          return query;
        };

        var loadFacetsCount = function(data){
          if(isLoadedFacetsCount === false){
            var hashLetter = false;
            if (window.location.hash){
              var match = location.hash.match(/^#?(.*)$/)[1];
              if (typeof match == 'string') {
                hashLetter = match.charAt(0).toUpperCase();
              }
            }

            var first = false;
            $.each(data, function(){
              $.each(this.data, function(letter, count){
                container.find('[data-start_letter="'+letter+'"]').show();
                if(first === false){
                  first = container.find('[data-start_letter="'+letter+'"]');
                }
              });
            });
            if (hashLetter && container.find('[data-start_letter="'+hashLetter+'"]').is(':visible')){
              first = container.find('[data-start_letter="'+hashLetter+'"]');
            }
            if (first){
              first.trigger('click');
            }
            isLoadedFacetsCount = true;
          }
        };

        resultsContainer.html(spinner);
        var loadContents = function () {
          var baseQuery = buildQuery();
          var paginatedQuery = baseQuery + ' and limit ' + limitPagination + ' offset ' + currentPage * limitPagination;
          resultsContainer.html(spinner);

          $.opendataTools.find(paginatedQuery, function (response) {
            queryPerPage[currentPage] = paginatedQuery;
            response.currentPage = currentPage;
            response.prevPage = currentPage - 1;
            response.nextPage = currentPage + 1;
            var pagination = response.totalCount > 0 ? Math.ceil(response.totalCount / limitPagination) : 0;
            var pages = [];
            var i;
            for (i = 0; i < pagination; i++) {
              queryPerPage[i] = baseQuery + ' and limit ' + limitPagination + ' offset ' + (limitPagination * i);
              pages.push({'query': i, 'page': (i + 1)});
            }
            response.pages = pages;
            response.pageCount = pagination;

            response.prevPageQuery = jQuery.type(queryPerPage[response.prevPage]) === "undefined" ? null : queryPerPage[response.prevPage];

            $.each(response.searchHits, function () {
              this.baseUrl = baseUrl;
              this.attributes = attributes;
              this.texts = texts;
            });
            var renderData = $(template.render(response));
            resultsContainer.html(renderData);

            resultsContainer.find('.page, .nextPage, .prevPage').on('click', function (e) {
              currentPage = $(this).data('page');
              if (currentPage >= 0) loadContents();
              e.preventDefault();
            });
            var more = $('<div class="other FlexItem"><span class="Button Button--info is-disabled">...</span></li');
            var displayPages = resultsContainer.find('.page[data-page_number]');

            var currentPageNumber = resultsContainer.find('.page[data-current]').data('page_number');
            var length = 7;
            if (displayPages.length > (length + 2)) {
              if (currentPageNumber <= (length - 1)) {
                resultsContainer.find('.page[data-page_number="' + length + '"]').parent().after(more.clone());
                for (i = length; i < pagination; i++) {
                  resultsContainer.find('.page[data-page_number="' + i + '"]').parent().hide();
                }
              } else if (currentPageNumber >= length) {
                resultsContainer.find('.page[data-page_number="1"]').parent().after(more.clone());
                var itemToRemove = (currentPageNumber + 1 - length);
                for (i = 2; i < pagination; i++) {
                  if (itemToRemove > 0) {
                    resultsContainer.find('.page[data-page_number="' + i + '"]').parent().hide();
                    itemToRemove--;
                  }
                }
                if (currentPageNumber < (pagination - 1)) {
                  resultsContainer.find('.page[data-current]').parent().after(more.clone());
                }
                for (i = (currentPageNumber + 1); i < pagination; i++) {
                  resultsContainer.find('.page[data-page_number="' + i + '"]').parent().hide();
                }
              }
            }
          });
        };

        if (container.find('form').length > 0) container.find('form')[0].reset();
        $.opendataTools.find(buildQuery() + ' limit 1', function (response) {
          loadFacetsCount(response.facets);
        });

        container.find('[data-start_letter]').on('click', function (e) {
          if (container.find('form').length > 0) {
            container.find('form')[0].reset();
            container.find('button[type="reset"]').addClass('hide');
          }
          var listItem = $(this);
          window.location.hash = listItem.data("start_letter");
          if (!listItem.hasClass('Button--default')) {
            container.find('[data-start_letter]').removeClass('Button--default').addClass('Button--info');
            listItem.removeClass('Button--info').addClass('Button--default');
          }
          currentPage = 0;
          queryPerPage = [];
          loadContents();
          e.preventDefault();
        });

        container.find('button[type="submit"]').on('click', function (e) {
          container.find('button[type="reset"]').removeClass('hide');
          container.find('[data-start_letter]').removeClass('Button--default').addClass('Button--info');
          history.pushState(null, null, ' ')
          currentPage = 0;
          loadContents();
          e.preventDefault();
        });
        container.find('button[type="reset"]').on('click', function (e) {
          if (container.find('form').length > 0) container.find('form')[0].reset();
          container.find('[data-start_letter]').first().removeClass('Button--info').addClass('Button--default');
          container.find('button[type="reset"]').addClass('hide');
          currentPage = 0;
          loadContents();
          e.preventDefault();
        });
      });
    });
  </script>
{/literal}
{/run-once}
