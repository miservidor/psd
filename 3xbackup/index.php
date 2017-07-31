<?php
require_once('lib/Backup.class.php');
$ini = parse_ini_file('../api/config.ini', true);
$backup = new Backup(
    $ini['Database']['host'],
    $ini['Database']['dbname'],
    $ini['Database']['user'],
    $ini['Database']['pw']);

if (isset($_GET['backup'])) {
    $ignore = array(
        '3xios'.DIRECTORY_SEPARATOR.'agimages',
        '3xios'.DIRECTORY_SEPARATOR.'artimages',
        '3xios'.DIRECTORY_SEPARATOR.'daten',
        '3xcms'.DIRECTORY_SEPARATOR.'config'.DIRECTORY_SEPARATOR.'uploads'
    );
    $backup->backup($ignore);
}
// elseif (@$_GET['delete']) {
//     $backup->delete($_GET['delete']);
// } elseif (@$_GET['restore']) {
//     if ($backup->restore($_GET['restore'])) {
//         echo "Erfolgreich wiederhergestellt!";
//     }
// }
?>

<!DOCTYPE html>
<html>
<head>
    <title>3X-Backup</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<form><input type="hidden" name="backup"></input><input type="submit" value="Backup"></input></form>
<table>
    <?php
        foreach ($backup->show() as $value) {
            echo '<tr>';
            echo '<td>'.$value.'</td>';
            // echo '<td><a href="archiv/'.$value.'" download>'.$value.'</a></td>';
            // echo '<td><form><input type="hidden" name="restore" value="'.$value.'"></input><input type="submit" value="Restore"></input></form></td>';
            // echo '<td><form><input type="hidden" name="delete" value="'.$value.'"></input><input type="submit" value="Delete"></input></form></td>';
            echo '</tr>';
        }
    ?>
</table>
</body>
</html>






