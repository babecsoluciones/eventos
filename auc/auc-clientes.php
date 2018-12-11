<?php
require_once("../cnx/swgc-mysql.php");
header('Content-Type: application/json');

$paquetes = array();

$select = "SELECT * FROM CatClientes";
$rsPaquetes = mysql_query($select);
while($rPaquete = mysql_fetch_array($rsPaquetes))
{
	$paquetes[] = array('codigo'=>$rPaquete{'eCodCliente'},'nombre'=>$rPaquete{'tNombres'}.' '.$rPaquete{'tApellidos'}.' ('.$rPaquete{'tCorreo'}.')');
}

echo json_encode($paquetes);

?>