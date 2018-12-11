<?php
require_once("cnx/swgc-mysql.php");
require_once("cls/cls-sistema.php");
$clSistema = new clSis();
session_start();
$bAll = $clSistema->validarPermiso($_GET['tCodSeccion']);
?>
<script>
function detalles(codigo)
    {
        window.location="?tCodSeccion=cata-eve-det&eCodEvento="+codigo;
    }
</script>
<div class="row">
	<div class="col-lg-12">
        <? if($clSistema->validarEnlace('oper-eve-reg')) { ?>
	<button type="button" class="btn btn-primary" onclick="window.location='?tCodSeccion=oper-eve-reg'"><i class="fa fa-plus"></i> Nuevo Evento</button>
        <? } ?>
	</div>
</div>
<div class="row">
                            <div class="col-lg-12">
                                <h2 class="title-1 m-b-25">Eventos</h2>
                                <div class="table-data__tool">
                                    <div class="table-data__tool-left">
                                        
                                        
                                    </div>
                                    <div class="table-data__tool-right">
                                       <input class="au-input" id='search' placeholder='Búsqueda rápida...'> 
                                    </div>
                                </div>
                                <div class="table-responsive table--no-card m-b-40" style="max-height:500px; overflow-y: scroll;">
                                    <table class="table table-borderless table-striped table-earning" id="table">
                                        <thead>
                                            
                                            <tr>
                                                <th class="text-right">E</th>
												<th class="text-right">Cliente</th>
												<th class="text-right">Fecha Evento (Hora de montaje)</th>
												<th class="text-right">Promotor</th>
                                                <th class="text-right"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
											<?
											$select = "SELECT be.*, cc.tNombres nombreCliente, cc.tApellidos apellidosCliente,
															su.tNombre as promotor, ce.tIcono FROM BitEventos be INNER JOIN CatClientes cc ON cc.eCodCliente = be.eCodCliente
															INNER JOIN CatEstatus ce ON ce.eCodEstatus = be.eCodEstatus
														LEFT JOIN SisUsuarios su ON su.eCodUsuario = be.eCodUsuario".
												($bAll ? "" : " WHERE cc.eCodUsuario = ".$_SESSION['sessionAdmin'][0]['eCodUsuario']).
														" ORDER BY be.fhFechaEvento DESC";
											
											
											$rsPublicaciones = mysql_query($select);
											
//echo $select;

while($rPublicacion = mysql_fetch_array($rsPublicaciones))
											{
												?>
											<tr>
                                                <td align="center"><i class="fa <?=$rPublicacion{'tIcono'}?>"></i></td>
												<td><?=utf8_decode($rPublicacion{'nombreCliente'}.' '.$rPublicacion{'apellidosCliente'})?></td>
												<td><?=date('d/m/Y H:i', strtotime($rPublicacion{'fhFechaEvento'}))?></td>
												<td><?=utf8_decode($rPublicacion{'promotor'})?></td>
                                                <td class="text-right"> 
													<button onclick="detalles(<?=$rPublicacion{'eCodEvento'}?>)"><i class="fa fa-eye"></i></button> 
                                                    <button onclick="cancelar(<?=$rPublicacion{'eCodEvento'}?>)"><i class="fa fa-trash-o"></i></button> 
													<button onclick="window.location='?tCodSeccion=oper-eve-reg&eCodEvento=<?=$rPublicacion{'eCodEvento'}?>'"><i class="fa fa-pencil-square-o"></i></button>
												</td>
                                            </tr>
											<?
											}
											?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>