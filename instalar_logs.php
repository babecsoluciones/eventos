<?
require_once("cnx/swgc-mysql.php");

$sql = array();

$sql[] = "DROP TABLE IF EXISTS `SisLogs`;";
$sql[] = "CREATE TABLE IF NOT EXISTS `SisLogs` (
  `eCodEvento` int(11) NOT NULL AUTO_INCREMENT,
  `eCodUsuario` int(11) NOT NULL,
  `fhFecha` datetime NOT NULL,
  `tDescripcion` VARCHAR(250) NOT NULL
  PRIMARY KEY (`eCodEvento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;";

$sql[] = "INSERT INTO `SisSecciones` (`tCodSeccion`, `tCodPadre`, `tTitulo`, `eCodEstatus`, `ePosicion`, `bFiltro`, `tIcono`) VALUES('cata-log-usr', 'inicio', 'Logs', 3, 15, 0, 'fa fa-file-text-o');";

for($i=0;$i<sizeof($sql);$i++)
{
    $rs = mysql_query($sql[$i]);
    
    echo $rs ? 'ok<br>' : $sql[$i].'<br>';
}
?>