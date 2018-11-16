<?
require_once("cnx/swgc-mysql.php");

$insert = "CREATE TABLE RelServiciosInventario (
  eCodServicio int(11) NOT NULL,
  eCodInventario int(11) NOT NULL,
  ePiezas int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;";
$rs = mysql_query($insert);
echo $rs ? 'ok' : mysql_error($rs) ;
?>