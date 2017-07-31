<?php
set_time_limit(0);
chdir('../api');
require_once '../api/config.php';
$DB = new PDO('mysql:dbname='.DB_NAME.';host='.DB_HOST, DB_USER, DB_PW);
ini_set('display_errors', 1);
error_reporting(E_ALL);

chdir('../db_update');
$meldung = array();
if (!file_exists('update.sql')) {
    $meldung[] = 'Datei update.sql fehlt in diesem Verzeichnis!';
}

if (empty($meldung)) {
    $query1 = $DB->query('SELECT versionsnummer, Datum, UpdateZaehler FROM 3xiosversionstext')->fetchAll(PDO::FETCH_ASSOC);
    $anz1 = count($query1);
    if ($anz1 == 1) {
        $ds1 = $query1[0];
        $ist_version = $ds1['versionsnummer'];
        $vabfragestr = '';
        $vp = fopen('update.sql', 'r');
        while (!feof($vp)) {
            $dp_zeile = fgets($vp);
            if (trim($dp_zeile) != '' && strpos($dp_zeile, '#') !== 0) {
                while (!feof($vp) && strpos($dp_zeile, ';') === false) {
                    $dp_zeile .= fgets($vp);
                }
                if (strpos($dp_zeile, '3xiosversionstext') !== false) {
                    $vabfragestr = $dp_zeile;
                }
            }
        }
        fclose($vp);
        if (!empty($vabfragestr)) {
            $pos1 = strpos($vabfragestr, 'versionsnummer');
            if ($pos1 !== false) {
                $pos2 = strpos($vabfragestr, "'", $pos1);
                if ($pos2 !== false) {
                    $pos3 = strpos($vabfragestr, "'", $pos2 + 1);
                    if ($pos3 !== false) {
                        $neu_version = substr($vabfragestr, ($pos2 + 1), ($pos3 - $pos2 - 1));
                        if (!empty($neu_version) && !empty($ist_version)) {
                            $vergleich1 = version_compare($ist_version, '13.0.0');
                            if ($vergleich1 >= 0) {
                                $vergleich2 = version_compare($neu_version, $ist_version);
                                if ($vergleich2 >= 0) {
                                    $vergleich3 = version_compare($ist_version, '15.0.0');
                                    $vergleich4 = version_compare($neu_version, '15.0.0');
                                    if ($vergleich4 == 1 && $vergleich3 == -1) {
                                        $meldung[] = 'Voraussetzung für ein Update ab Version 15.0.01 ist eine installierte Version 15.0.00 oder höher!';
                                    }
                                } else {
                                    $meldung[] = 'Die Updateversion ist älter als die installierte Shopversion!';
                                }
                            } else {
                                $meldung[] = 'Ihre Shopinstallation ist für dieses Update zu alt! Sie benötigen ein Upgrade auf Version 13.0.00 oder höher.';
                            }
                        } else {
                            $meldung[] = 'Die Datei update.sql scheint kein Update für den Webshop zu beinhalten!';
                        }
                    } else {
                        $meldung[] = 'Die Datei update.sql scheint kein Update für den Webshop zu beinhalten!';
                    }
                } else {
                    $meldung[] = 'Die Datei update.sql scheint kein Update für den Webshop zu beinhalten!';
                }
            } else {
                $meldung[] = 'Die Datei update.sql scheint kein Update für den Webshop zu beinhalten!';
            }
        } else {
            $meldung[] = 'Die Datei update.sql scheint kein Update für den Webshop zu beinhalten!';
        }
    } else {
        $meldung[] = 'Bei der Versionsüberprüfung der installierten Version ist ein Fehler aufgetreten!';
    }
}

if (isset($_GET['sm_start']) && empty($meldung)) {
    function delete_rek($dir, $keepRoot = false, $ignore = array())
    {
        if (is_file($dir) && !in_array(basename($dir), $ignore)) {
            unlink($dir);
        } elseif (is_dir($dir) && !in_array(basename($dir), $ignore)) {
            foreach (scandir($dir) as $datei) {
                if ($datei != '.' && $datei != '..') {
                    delete_rek($dir.DIRECTORY_SEPARATOR.$datei, false, $ignore);
                }
            }
            if (!$keepRoot) {
                rmdir($dir);
            }
        }
    }

    delete_rek('../3xcms/module');
    delete_rek('../3xcms/config', true, array('uploads'));
    $fp = fopen('update.sql', 'r');
    while (!feof($fp)) {
        $akt_zeile = fgets($fp);
        if (trim($akt_zeile) != '' && strpos($akt_zeile, '#') !== 0) {
            while (!feof($fp) && strpos($akt_zeile, ';') === false) {
                $akt_zeile .= fgets($fp);
            }
            $DB->exec(trim($akt_zeile));
        }
    }
    fclose($fp);
    $beendet = 1;
    $query2 = $DB->query('SELECT versionsnummer, Datum, UpdateZaehler FROM 3xiosversionstext')->fetch(PDO::FETCH_ASSOC);
    $ist_version = $query2['versionsnummer'];
}
?>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  <title>MySQL-DB Update</title>
</head>
<body>
  <?php
  echo '<table>';
  if (!empty($ist_version)) {
      echo '<tr>';
      echo '<td>Installierte Version:</td>';
      echo '<td>'.$ist_version.'</td>';
      echo '</tr>';
  }
 if (!empty($neu_version)) {
     echo '<tr>';
     echo '<td>Update-Version:</td>';
     echo '<td>'.$neu_version.'</td>';
     echo '</tr>';
 }
 echo '</table>';

 $bt_disabled = '';
 if (!empty($meldung) || isset($beendet)) {
     $bt_disabled = ' disabled';
 }
 if (isset($beendet)) {
     echo '<table>';
     echo '<tr>';
     echo '<td>Das Webupdate der MySQL-DB ist beendet.</td>';
     echo '</tr>';
     echo '</table>';
 }
 if (!empty($meldung)) {
     echo '<table>';
     echo '<tr>';
     echo '<td>';
     foreach ($meldung as $value) {
         echo '<div style="color:#FF0000">'.$value.'</div>';
     }
     echo '</td>';
     echo '</tr>';
     echo '</table>';
 }
echo '<table>';
echo '<tr>';
echo '<td style="padding-top:20px;">';
echo '<form action="'.$_SERVER['PHP_SELF'].'" name="frm_update" method="get">';
echo '<input type="submit" name="sm_start" value="starten"'.$bt_disabled.'>';
echo '</form>';
echo '</td>';
echo '</tr>';
echo '</table>';
echo '</body>';
echo '</html>';
