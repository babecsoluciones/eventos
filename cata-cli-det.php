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
                                <div class="form-group">
                                    <div class="col-md-6">
                                    <label>Nombre(s)</label>
              <?=$rCliente{'tNombres'}?>
                                    </div>
                                    <div class="col-md-6">
                                    <label>Apellido(s)</label>
              <?=$rCliente{'tApellidos'}?>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>E-mail</label>
              <?=$rCliente{'tCorreo'}?>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-6">
                                    <label>Teléfono Fijo</label>
              <?=$rCliente{'tTelefonoFijo'}?>
                                    </div>
                                    <div class="col-md-6">
                                    <label>Teléfono Móvil</label>
              <?=$rCliente{'tTelefonoMovil'}?>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Comentarios</label>
              <?=$rCliente{'tComentarios'}?>
                                </div>
                                    
                            </div>
    
    
                            <div class="col-lg-12">
                                
                                    <div class="card card-body card-block">
                                    <table class="table table-responsive table-borderless table-top-campaign" id="table" width="100%">
                                        <thead>
                                            
                                            <tr>
                                                <th>Evento</th>
												<th># Conceptos</th>
                                                <th>Fecha del evento</th>
                                                <th>Detalles</th>
                                            </tr>
                                        </thead>
                                        <tbody>
											<?
                                            $i = 0;
											$select = "	SELECT be.eCodEvento, be.fhFechaEvento, (SELECT COUNT(*) FROM RelEventosRelEventosPaquetes WHERE eCodEvento = be.eCodEvento) as Conceptos FROM BitEventos be WHERE be.eCodCliente = ".$_GET['eCodCliente'];
											$rsPublicaciones = mysql_query($select);
                                            
											while($rPublicacion = mysql_fetch_array($rsPublicaciones))
											{
												?>
											<tr>
                                                <td valign="top"><?=sprintf("%07d",$rPublicacion{'eCodEvento'})?></td>
                                                <td>
                                                  <?=$rPublicacion{'Conceptos'}?> conceptos totales
                                                </td>
                                                <td align="center" valign="top">
                                                    <?=date('d/m/Y',strtotime($rPublicacion{'fhFechaEvento'}))?>
                                                </td>
                                                <td>
                                                    <a href="?tCodSeccion=cata-eve-det.pph?eCodEvento=<?=$rPublicacion{'eCodEvento'}?>" target="_blank" class="btn btn-info">Ver Detalles</a>
                                                </td>
                                            </tr>
											<?
											$i++;
											}
												?>
                                        </tbody>
                                    </table>
      
                                    </div>
                                </div>
                        </div>