<?
require_once("cnx/swgc-mysql.php");

$sql = array();

$sql[] = "DROP TABLE IF EXISTS `BitEventos`;";
$sql[] = "CREATE TABLE IF NOT EXISTS `BitEventos` (
  `eCodEvento` int(11) NOT NULL AUTO_INCREMENT,
  `eCodUsuario` int(11) NOT NULL,
  `eCodCliente` int(11) NOT NULL,
  `fhFechaEvento` datetime NOT NULL,
  `tDireccion` text NOT NULL,
  `tObservaciones` text NOT NULL,
  PRIMARY KEY (`eCodEvento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;";
$sql[] = "CREATE TABLE RelEventosPaquetes
(
    eCodEvento  INT NOT NULL,
    eCodServicio    INT NOT NULL,
    eCantidad       INT NOT NULL
)";
$sql[] = "INSERT INTO `SisSecciones` (`tCodSeccion`, `tCodPadre`, `tTitulo`, `eCodEstatus`, `ePosicion`, `bFiltro`, `tIcono`) VALUES('oper-eve-reg', 'cata-eve-con', '+ Eventos', 3, 1, 0, 'fa fa-file-text-o');";

for($i=0;$i<sizeof($sql);$i++)
{
    $rs = mysql_query($sql[$i]);
    
    echo $rs ? 'ok<br>' : $sql[$i].'<br>';
}
?>