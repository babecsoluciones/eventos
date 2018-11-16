<?php
require_once("cnx/swgc-mysql.php");
require_once("cls/cls-sistema.php");
$clSistema = new clSis();
session_start();
$select = "SELECT * FROM CatClientes WHERE eCodCliente = ".$_GET['eCodCliente'];
$rsCliente = mysql_query($select);
$rCliente = mysql_fetch_array($rsCliente);
?>
<div class="row">
	<div class="col-lg-12">
        <? if($clSistema->validarEnlace('cata-cli-con')) { ?>
	<button type="button" class="btn btn-primary" onclick="window.location='?tCodSeccion=cata-cli-con'"><i class="fa fa-arrow-left"></i> Volver al cat&aacute;logo</button>
        <? } ?>
	</div>
</div>
<div class="row">
                            <div class="col-lg-12">
                                <h2 class="title-1 m-b-25">Detalles del Cliente</h2>
                                
                                    <table class="table">
                                        <tr>
                                            <td>Nombre(s)</td>
                                            <td><?=$rCliente{'tNombres'}?></td>
                                            <td>Apellido(s)</td>
                                            <td><?=$rCliente{'tApellidos'}?></td>
                                        </tr>
                                        <tr>
                                            <td>E-mail</td>
                                            <td colspan="4"><?=$rCliente{'tCorreo'}?></td>
                                        </tr>
                                        <tr>
                                            <td>Teléfono Fijo</td>
                                            <td><?=$rCliente{'tTelefonoFijo'}?></td>
                                            <td>Teléfono Móvil</td>
                                            <td><?=$rCliente{'tTelefonoMovil'}?></td>
                                        </tr>
                                    </table>
                                
                            </div>
                        </div>