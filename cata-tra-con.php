<?php
require_once("cnx/swgc-mysql.php");
require_once("cls/cls-sistema.php");
$clSistema = new clSis();
session_start();

?>
<div class="row">
	<div class="col-lg-12">

	</div>
</div>
<div class="row">
                            <div class="col-lg-12">
                                <h2 class="title-1 m-b-25">&Uacute;ltimas transacciones</h2>
                                <div class="table-responsive table--no-card m-b-40">
                                    <table class="table table-borderless table-striped table-earning">
                                        <thead>
                                            <tr>
												<th>C&oacute;digo</th>
                                                <th>Fecha</th>
                                                <th>Cliente</th>
                                                <th class="text-right">Usuario</th>
                                                <th class="text-right">Forma de Pago</th>
                                                <th class="text-right"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
											<?
											$select = "SELECT bt.eCodTransaccion, bt.fhFecha, bd.eCodEvento, cc.tNombres as nombreCliente, cc.tApellidos as apellidosCliente, bt.dMonto, ctp.tNombre, (su.tNombre) as nombreUsuario, su.tApellidos as apellidosUsuario FROM BitTransacciones bt INNER JOIN CatTiposPagos ctp ON ctp.eCodTipoPago = bt.eCodTipoPago INNER JOIN BitEventos be ON be.eCodEvento = bt.eCodEvento INNER JOIN CatClientes cc ON cc.eCodCliente = be.eCodCliente INNER JOIN SisUsuarios su ON su.eCodUsuario = bt.eCodUsuario WHERE ORDER BY bt.eCodTransaccion DESC LIMIT 0,25";
											$rsPublicaciones = mysql_query($select);
											while($rPublicacion = mysql_fetch_array($rsPublicaciones))
											{
												?>
											<tr>
                                                <td><?=sprintf("%07d",$rPublicacion{'eCodTransaccion'})?></td>
                                                <td><?=date('d/m/Y',strtotime($rPublicacion{'fhFecha'}))?></td>
												<td><?=utf8_decode($rPublicacion{'nombreCliente'} . ' '.$rPublicacion{'apellidosCliente'})?></td>
                                                <td><?=utf8_decode($rPublicacion{'nombreUsuario'}.' '.$rPublicacion{'apellidosUsuario'})?></td>
												<td><?=utf8_decode($rPublicacion{'tNombre'})?></td>
                                                <td class="text-right"> 
													<button type="button" class="btn btn-secondary mb-1" onclick="window.location='?tCodSeccion=cata-eve-det&eCodEvento=<?=$rPublicacion{'eCodEvento'}?>'">
														Ver Detalles
													</button>
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

