<?php

class OpenPAEventCalendarViewClassExtraParameters extends OCClassExtraParametersHandlerBase
{

  public function getIdentifier()
  {
    return 'event_calendar';
  }

  public function getName()
  {
    return "Impostazioni della visualizzazione calendario";
  }

  public function attributes()
  {
    $attributes = parent::attributes();

    $attributes[] = 'filters';
    $attributes[] = 'default_filter';
    // Determines the first time slot that will be displayed for each day.
    $attributes[] = 'min_time';
    // Determines the last time slot that will be displayed for each day.
    $attributes[] = 'max_time';


    return $attributes;
  }

  public function attribute($key)
  {
    switch ($key) {
      case 'filters':
        return json_decode($this->getClassParameter($key));
      case 'default_filter':
      case 'min_time':
      case 'max_time':
        return $this->getClassParameter($key);
    }

    return parent::attribute($key);
  }

  protected function handleAttributes()
  {
    return false;
  }

  protected function attributeEditTemplateUrl()
  {
    return 'design:openpa/extraparameters/' . $this->getIdentifier() . '/edit_attribute.tpl';
  }

  protected function classEditTemplateUrl()
  {
    return 'design:openpa/extraparameters/' . $this->getIdentifier() . '/edit_class.tpl';
  }

  public function storeParameters($data)
  {
    if ( OCClassExtraParametersManager::currentUserCanEditHandlers( $this->getIdentifier() ) )
    {
      $classData = isset( $data['class'] ) ? $data['class'] : array();
      OCClassExtraParameters::removeByHandlerAndClassIdentifier(
        $this->getIdentifier(),
        $this->class->Identifier
      );

      foreach ( $classData as $classIdentifier => $values )
      {
        foreach ( $values as $key => $value )
        {
          $row = array(
            'class_identifier' => $classIdentifier,
            'attribute_identifier' => '*',
            'handler' => $this->getIdentifier(),
            OCClassExtraParameters::getKeyDefinitionName() => $key,
            'value' => is_array($value) ? json_encode($value) : $value
          );
          $parameter = new OCClassExtraParameters( $row );
          $parameter->store();
        }
      }
      $this->loadParameters( true );
    }

    OpenPAINI::clearDynamicIniCache();
    eZContentCacheManager::clearAllContentCache(true);
  }

}
