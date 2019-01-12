<?
require_once("cnx/swgc-mysql.php");

$sql = array();

$sql[] = "DROP TABLE IF EXISTS `BitTransacciones`;";
$sql[] = "CREATE TABLE IF NOT EXISTS `BitTransacciones` (
  `eCodTransaccion` int(11) NOT NULL AUTO_INCREMENT,
  `eCodUsuario` int(11) NOT NULL,
  `eCodEvento` int(11) NOT NULL,
  `fhFecha` datetime NOT NULL,
  `dMonto` double NOT NULL,
  `eCodTipoPago` int NOT NULL,
  PRIMARY KEY (`eCodTransaccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;";
$sql[] = "DROP TABLE IF EXISTS `CatTiposPagos`;";
$sql[] = "CREATE TABLE CatTiposPagos
(
    eCodTipoPago  INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tNombre    VARCHAR(25) NOT NULL
)";
$sql[] = "INSERT INTO `CatTiposPagos` (`tNombre`) VALUES('Efectivo');";
$sql[] = "INSERT INTO `CatTiposPagos` (`tNombre`) VALUES('Tarjeta');";
$sql[] = "INSERT INTO `CatTiposPagos` (`tNombre`) VALUES('Cheque');";
$sql[] = "INSERT INTO `CatTiposPagos` (`tNombre`) VALUES('Transferencia');";

for($i=0;$i<sizeof($sql);$i++)
{
    $rs = mysql_query($sql[$i]);
    
    echo $rs ? 'ok<br>' : $sql[$i].'<br>';
}
?>