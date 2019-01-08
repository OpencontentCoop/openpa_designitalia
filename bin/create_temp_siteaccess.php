<?php
require 'autoload.php';

$script = eZScript::instance(array('description' => ("OpenPA Designitalia crea siteaccess temporaneo\n\n"),
  'use-session' => false,
  'use-modules' => true,
  'use-extensions' => true));

$script->startup();

$options = $script->getOptions();
$script->initialize();
$script->setUseDebugAccumulators(true);
$output = new ezcConsoleOutput();
$cli = eZCLI::instance();

function getSiteAccessIni( $siteAccess, $iniFile )
{
  $saPath = 'settings/siteaccess/' . $siteAccess;
  return eZINI::fetchFromFile( "$saPath/$iniFile" );
}

try {

  $current = OpenPABase::getCurrentSiteaccessIdentifier();

  $frontendDirectory = "settings/siteaccess/{$current}_frontend";
  $newDirectory = "settings/siteaccess/{$current}_new";
  $prototypeDirectory = "settings/siteaccess/prototipo_frontend";

  $cli->output("Creo $newDirectory");
  eZDir::mkdir($newDirectory);

  $cli->output("Clono $frontendDirectory");
  eZDir::copy($frontendDirectory, $newDirectory, false);

  if (file_exists($newDirectory . "/browse.ini.append.php"))
    unlink($newDirectory . "/browse.ini.append.php");

  $cli->output("Rimuovo file obsoleti");

  foreach(array('block', 'zone') as $iniFileName) {
    eZFileHandler::copy(
      $prototypeDirectory . "/{$iniFileName}.ini.append.php",
      $newDirectory . "/{$iniFileName}.ini.append.php"
    );
    $cli->output("Creo {$iniFileName}.ini");
  }

  $frontedSiteIni = getSiteAccessIni("{$current}_frontend", 'site.ini.append.php');
  $prototypeSiteIni = getSiteAccessIni("prototipo_frontend", 'site.ini.append.php');
  $newSiteIni = getSiteAccessIni("{$current}_new", 'site.ini.append.php');
  $backendSiteIni = getSiteAccessIni("{$current}_backend", 'site.ini.append.php');
  $openpaIni = getSiteAccessIni("{$current}_new", 'openpa.ini.append.php');
  $contentIni = getSiteAccessIni("{$current}_new", 'content.ini.append.php');

  $newSiteIni->setVariable(
    'ExtensionSettings', 'ActiveAccessExtensions',
    $prototypeSiteIni->variable('ExtensionSettings', 'ActiveAccessExtensions')
  );

  $newSiteIni->setVariable(
    'SiteSettings', 'IndexPage',
    '/openpa/object/homepage'
  );

  $newSiteIni->setVariable(
    'SiteSettings', 'DefaultPage',
    '/openpa/object/homepage'
  );

  $newSiteIni->setVariable(
    'DesignSettings', 'SiteDesign',
    'designitalia'
  );

  $newSiteIni->setVariable(
    'DesignSettings', 'AdditionalSiteDesignList',
    array(
      '',
      'openpa_solid',
      'ocbootstrap',
      'standard'
    )
  );
  if ($newSiteIni->save(false, false, false, false, false))
    $cli->output("Creo site.ini");

  $openpaIni->setVariable('Stili', 'Nodo_NomeStile', array('', '0;u-background-grey-20'));
  $openpaIni->setVariable('Stili', 'UsaNeiBlocchi', 'enabled');
  if ($openpaIni->save(false, false, false, false, false))
    $cli->output("Creo openpa.ini");

  $contentIni->setVariable('NodeSettings', 'HomepageNode', 'homepage');
  if ($contentIni->save(false, false, false, false, false))
    $cli->output("Corretto content.ini");

  if (!in_array(
    "{$current}_new",
    $backendSiteIni->variable('SiteAccessSettings', 'RelatedSiteAccessList')
  )) {
    $backendSiteIni->setVariable(
      'SiteAccessSettings', 'RelatedSiteAccessList',
      array_merge(
        $backendSiteIni->variable('SiteAccessSettings', 'RelatedSiteAccessList'),
        array("{$current}_new")
      )
    );
  }
  $backendSiteIni->setVariable(
    'DesignSettings', 'AdditionalSiteDesignList',
    array_merge(
      array(""),
      $backendSiteIni->variable('DesignSettings', 'AdditionalSiteDesignList')
    )
  );
  $backendSiteIni->setVariable(
    'SiteAccessRules', 'Rules',
    array_merge(
      array(""),
      $backendSiteIni->variable('SiteAccessRules', 'Rules')
    )
  );
  if ($backendSiteIni->save(false, false, false, false, false))
    $cli->output("Correggo site.ini backend");

  $siteUrl = $frontedSiteIni->variable('SiteSettings', 'SiteURL');

  $override = file_get_contents("settings/override/site.ini.append.php");
  if (strpos($override, "{$current}_new") === false) {
    $override = str_replace(
      "SiteList[]={$current}_backend",
      "SiteList[]={$current}_backend\nSiteList[]={$current}_new",
      $override
    );
    $override = str_replace(
      "AvailableSiteAccessList[]={$current}_backend",
      "AvailableSiteAccessList[]={$current}_backend\nAvailableSiteAccessList[]={$current}_new",
      $override
    );
    $override = str_replace(
      "HostUriMatchMapItems[]={$siteUrl};backend;{$current}_backend",
      "HostUriMatchMapItems[]={$siteUrl};backend;{$current}_backend\nHostUriMatchMapItems[]={$siteUrl};new;{$current}_new",
      $override
    );

    if (file_put_contents("settings/override/site.ini.append.php", $override)) {
      $cli->output("Modifico override/site.ini ($siteUrl)");
    }
  }

  $script->shutdown();
} catch (Exception $e) {
  $errCode = $e->getCode();
  $errCode = $errCode != 0 ? $errCode : 1; // If an error has occured, script must terminate with a status other than 0
  $script->shutdown($errCode, $e->getMessage());
}
