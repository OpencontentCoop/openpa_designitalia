{if and( is_set( $survey_validation ), or( $survey_validation.errors, $survey_validation.warnings ) )}
  <div class="Prose Alert Alert--warning" role="alert">
    <h2 class="u-text-r-l">{"Warning"|i18n( 'survey' )}</h2>
    <ul>
      {foreach $survey_validation.errors as $key => $error}
        <li>
          <a href="#survey_question_{$error.question_number}">{$error.message}</a>
        </li>
      {/foreach}
      {foreach $survey_validation.warnings as $key => $warning}
        <li>
        <a href="#survey_question_{$warning.question_number}">{$warning.message}</a>
        </li>
      {/foreach}
    </ul>
  </div>
{/if}
