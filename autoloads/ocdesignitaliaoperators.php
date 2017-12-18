<?php
class OCDesignItaliaOperators
{
  function operatorList()
  {
    return array(
        'ocdesignitalia_main_image'
    );
  }
  function namedParameterPerOperator()
  {
    return true;
  }
  function namedParameterList()
  {
    return array(
        'ocdesignitalia_main_image' => array(
            'object' => array( 'type' => 'object', 'required' => true )
        )
    );
  }
  function modify( $tpl, $operatorName, $operatorParameters, $rootNamespace, $currentNamespace, &$operatorValue, $namedParameters )
  {
    try{
      switch ( $operatorName ){
        case 'ocdesignitalia_main_image':{
          $object = $namedParameters['object'];
          $operatorValue = $this->findMainImage($object);
        } break;
      }
    }catch( Exception $e ){
      eZDebug::writeError( $e->getMessage(), __METHOD__ . ':' . $operatorName );
    }
  }
  private function findMainImage($object)
  {
    if ($object instanceof eZContentObject || $object instanceof eZContentObjectTreeNode){
      /** @var eZContentObjectAttribute[] $dataMap */
      $dataMap = $object->attribute('data_map');
      if (isset($dataMap['image']) && $dataMap['image']->hasContent()){
        return $dataMap['image'];
      }elseif (isset($dataMap['immagini']) && $dataMap['immagini']->hasContent()){
        $ids = explode('-', $dataMap['immagini']->toString());
        $firstId = array_shift($ids);
        $firstObject = eZContentObject::fetch((int)$firstId);
        return $this->findMainImage($firstObject);
      }
    }
    return array(
        'content' => false
    );
  }
}