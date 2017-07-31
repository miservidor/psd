<?php

function startsWith($haystack, $needle)
{
    return $needle === "" || strrpos($haystack, $needle, -strlen($haystack)) !== false;
}

function delTree($dir, $root = true)
{
    $files = array_diff(scandir($dir), array('.', '..', '3xbackup', '.git'));
    foreach ($files as $file) {
        (is_dir("$dir/$file")) ? delTree("$dir/$file", false) : unlink("$dir/$file");
    }
    if (!$root) {
        rmdir($dir);
    }
}

if (!class_exists('RecursiveCallbackFilterIterator')) {
    class RecursiveCallbackFilterIterator extends RecursiveFilterIterator
    {
        public function __construct(RecursiveIterator $iterator, $callback)
        {
            $this->callback = $callback;
            parent::__construct($iterator);
        }
    
        public function accept()
        {
            $callback = $this->callback;
            return $callback(parent::current(), parent::key(), parent::getInnerIterator());
        }
    
        public function getChildren()
        {
            return new self($this->getInnerIterator()->getChildren(), $this->callback);
        }
    }
}

class Backup
{
    private $db_host, $db_name, $db_user, $db_pw, $archiv_dir;

    public function __construct($db_host, $db_name, $db_user, $db_pw)
    {
        $this->db_host = $db_host;
        $this->db_name = $db_name;
        $this->db_user = $db_user;
        $this->db_pw =  $db_pw;
        @mkdir(__DIR__.'/../archiv');
        $this->archiv_dir = realpath(__DIR__.'/../archiv');
    }

    public function backup($ignoreFolders = null)
    {
        set_time_limit(0);
        @mkdir($this->archiv_dir);
        $name = date("ymd-His");
        $zip = new ZipArchive();
        $zip->open($this->archiv_dir.'/'.$name.'.zip', ZipArchive::CREATE);
        $this->backupDB($zip, $name);
        $this->backupData($zip, $ignoreFolders);
        $zip->close();
        unlink('dump.sql');
    }

    public function restore($name)
    {
        set_time_limit(0);
        $root = realpath(__DIR__.'/../../');
        //delTree($root);
        $zip = new ZipArchive;
        $zip->open($this->archiv_dir.'/'.$name);
        $zip->extractTo($root);
        $zip->close();
        $params[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;
        $SQL = new PDO("mysql:dbname=$this->db_name;host=$this->db_host", $this->db_user, $this->db_pw, $params);
        $SQL->exec('SET foreign_key_checks = 0');
        $result = $SQL->query("SHOW TABLES");
        $result = $result->fetchAll(PDO::FETCH_NUM);
        foreach ($result as $table) {
            $SQL->exec('DROP TABLE IF EXISTS '.$table[0]);
        }
        $SQL->exec('SET foreign_key_checks = 1');
        $SQL->exec("set names utf8");
        $fp = fopen($root.'/db_update/backup_'.str_replace('.zip', '.sql', $name), 'r');
        while (!feof($fp)) {
            $akt_zeile = fgets($fp);
            $akt_zeile = trim($akt_zeile);
            if ($akt_zeile!="" && strpos($akt_zeile, "#")!==0 && strpos($akt_zeile, "/*")!==0) {
                while (!feof($fp) && strpos($akt_zeile, ";")===false) {
                    $akt_zeile.=fgets($fp);
                }
                $SQL->exec(trim($akt_zeile));
            }
        }
        fclose($fp);
        return true;
    }

    public function delete($name)
    {
        unlink($this->archiv_dir.'/'.$name);
    }

    public function show()
    {
        $files = scandir($this->archiv_dir);
        foreach ($files as $id => $file) {
            if ($file == '.' || $file == '..') {
                unset($files[$id]);
            }
        }
        return $files;
    }

    private function backupDB(&$zip, $name)
    {
        require_once(__DIR__.'/Mysqldump/Mysqldump.php');
        $dump = new Ifsnop\Mysqldump\Mysqldump('mysql:host='.$this->db_host.';dbname='.$this->db_name, $this->db_user, $this->db_pw, array(
            'skip-comments' => true,
            'skip-dump-date' => true,
            'add-drop-table' => true));
        $dump->start('dump.sql');
        $zip->addFile('dump.sql', 'db_update/backup_'.$name.'.sql');
    }

    private function backupData(&$zip, $ignoreFolders = null)
    {
        $root = realpath(__DIR__.'/../../');
        $ignoreFolders[] = '3xbackup';
        $ignoreFolders[] = '.git';
        $filter = function ($file, $key, $iterator) use ($ignoreFolders) {
            if ($file->isFile()) {
                return true;
            }
            if ($iterator->hasChildren()) {
                foreach ($ignoreFolders as $ignore) {
                    if (strpos($file->getPathName(), $ignore) !== false) {
                        return false;
                    }
                }
                return true;
            }
            return false;
        };
        $dirIter = new RecursiveDirectoryIterator($root, RecursiveDirectoryIterator::SKIP_DOTS);
        $filterIter = new RecursiveCallbackFilterIterator($dirIter, $filter);
        $iter = new RecursiveIteratorIterator($filterIter, RecursiveIteratorIterator::SELF_FIRST);
        $len = strlen($root)+1;
        foreach ($iter as $path) {
            $file = substr($path, $len);
            if (is_dir($path)) {
                $zip->addEmptyDir($file);
            } elseif (is_file($path)) {
                $zip->addFile($path, $file);
            }
        }
    }
}
