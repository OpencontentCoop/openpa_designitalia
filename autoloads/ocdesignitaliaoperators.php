<?php

class OCDesignItaliaOperators
{
  function operatorList()
  {
    return array(
      'ocdesignitalia_main_image',
      'ocdesignitalia_opengraph',
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
        'object' => array('type' => 'object', 'required' => true)
      ),
      'ocdesignitalia_opengraph' => array(
        'node' => array('type' => 'object', 'required' => true)
      ),
    );
  }

  function modify(
    $tpl,
    $operatorName,
    $operatorParameters,
    $rootNamespace,
    $currentNamespace,
    &$operatorValue,
    $namedParameters
  )
  {
    try {
      switch ($operatorName) {
        case 'ocdesignitalia_opengraph':
          $operatorValue = $this->loadOpenGraphData($namedParameters['node']);
          break;
        case 'ocdesignitalia_main_image':
          {
            eZDebug::writeError('Operatore ocdesignitalia_main_image deprecato: usare "$node|attribute(image)"', __METHOD__);
            $object = $namedParameters['object'];
            $operatorValue = $this->findMainImage($object);
          }
          break;
      }
    } catch (Exception $e) {
      eZDebug::writeError($e->getMessage(), __METHOD__ . ':' . $operatorName);
    }
  }

  private function findMainImage($object)
  {
    if ($object instanceof eZContentObject || $object instanceof eZContentObjectTreeNode) {
      /** @var eZContentObjectAttribute[] $dataMap */
      $dataMap = $object->attribute('data_map');
      if (isset($dataMap['image']) && $dataMap['image']->hasContent()) {
        return $dataMap['image'];
      } elseif (isset($dataMap['immagini']) && $dataMap['immagini']->hasContent()) {
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

  private function loadOpenGraphData($contentNode)
  {
    $returnArray = [];
    if ($contentNode instanceof eZContentObjectTreeNode) {
      $dataMap = $contentNode->dataMap();
      $siteName = trim(eZINI::instance()->variable('SiteSettings', 'SiteName'));
      $returnArray['og:site_name'] = $siteName;

      $urlAlias = $contentNode->urlAlias();
      eZURI::transformURI($urlAlias, false, 'full');
      $returnArray['og:url'] = $urlAlias;

      $returnArray['og:type'] = 'article';
      $returnArray['article:published_time'] = date('c', $contentNode->object()->attribute('published'));
      $returnArray['article:modified_time'] = date('c', $contentNode->object()->attribute('modified'));
      if ($contentNode->object()->attribute('owner_id') != eZINI::instance()->variable("UserSettings", "UserCreatorID")) {
        if ($owner = $contentNode->object()->attribute('owner')) {
          $returnArray['article:author'] = $owner->attribute('name');
        }
      } else {
        $returnArray['article:author'] = $siteName;
      }

      $tags = [];
      foreach ($dataMap as $identifier => $attribute) {
        if ($attribute->attribute('data_type_string') == eZTagsType::DATA_TYPE_STRING && $attribute->hasContent()) {
          /** @var eZTags $attributeContent */
          $attributeContent = $attribute->content();
          $tags = array_merge($tags, $attributeContent->attribute('keywords'));
        }
        if ($attribute->attribute('data_type_string') == eZGmapLocationType::DATA_TYPE_STRING && $attribute->hasContent()) {
          /** @var eZGmapLocation $attributeContent */
          $attributeContent = $attribute->content();
          $returnArray['og:street-address'] = $attributeContent->attribute('address');
          $returnArray['og:latitude'] = $attributeContent->attribute('latitude');
          $returnArray['og:longitude'] = $attributeContent->attribute('longitude');
        }
        if (!isset($returnArray['og:description'])
          && in_array($attribute->attribute('data_type_string'), [eZTextType::DATA_TYPE_STRING, eZXMLTextType::DATA_TYPE_STRING])
          && $attribute->hasContent()) {
          $returnArray['og:description'] = str_replace("\n", " ", strip_tags(trim($attribute->attribute('data_text'))));
        }
      }
      if (!isset($returnArray['og:description'])) {
        $returnArray['og:description'] = $contentNode->attribute('name');
      }
      if (!empty($tags)) {
        $returnArray['article:tag'] = array_unique($tags);
      }

      $image = $this->loadImage(['image', 'images'], $dataMap);
      if ($image) {
        $alias = $image->attribute('large');
        $returnArray['og:image'] = $alias['url'];
      }
      if (!isset($returnArray['og:image'])) {
        $logo = (array)OpenPaFunctionCollection::fetchHeaderLogo();
        if (isset($logo['url'])) {
          $returnArray['og:image'] = $logo['url'];
        }
      }
      $returnArray['og:title'] = $contentNode->attribute('name');

      $pagedata = new \OpenPAPageData();
      $contacts = $pagedata->getContactsData();
      if (isset($contacts['email'])) {
        $returnArray['og:email'] = $contacts['email'];
      }
      if (isset($contacts['telefono'])) {
        $returnArray['og:phone_number'] = $contacts['telefono'];
      }
      if (isset($contacts['fax'])) {
        $returnArray['og:fax_number'] = $contacts['fax'];
      }

      if (isset($returnArray['og:image'])) {
        $file = eZClusterFileHandler::instance($returnArray['og:image']);
        if ($file->exists()) {
          $file->fetch();
          $returnArray['og:image:type'] = $file->dataType();
          $info = getimagesize($returnArray['og:image']);
          if ($info) {
            $returnArray['og:image:width'] = $info[0];
            $returnArray['og:image:height'] = $info[1];
          }
          $file->deleteLocal();
        }
        eZURI::transformURI($returnArray['og:image'], true, 'full');

      }

      $returnArray['og:locale'] = str_replace('-', '_', eZLocale::instance()->httpLocaleCode());
    }

    return $returnArray;
  }

  /**
   * @param string[] $mainImages
   * @param eZContentObjectAttribute[] $dataMap
   *
   * @return eZImageAliasHandler|false
   */
  private function loadImage($mainImages, $dataMap)
  {
    foreach ($mainImages as $mainImage) {
      if (isset($dataMap[$mainImage]) && $dataMap[$mainImage]->hasContent()) {
        if ($dataMap[$mainImage]->attribute('data_type_string') == eZImageType::DATA_TYPE_STRING) {

          return $dataMap[$mainImage]->content();

        } elseif ($dataMap[$mainImage]->attribute('data_type_string') == eZObjectRelationListType::DATA_TYPE_STRING) {
          $imagesIdList = explode('-', $dataMap[$mainImage]->toString());
          foreach ($imagesIdList as $id) {
            $object = eZContentObject::fetch((int)$id);
            $dataMap = $object->dataMap();
            $image = $this->loadImage(['image'], $dataMap);
            if ($image) {
              return $image;
            }
          }
        }
      }
    }

    return false;
  }
}
