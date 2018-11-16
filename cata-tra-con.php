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
                                                <th class="text-right">Eventos</th>
                                                <th class="text-right"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
											<?
											$select = "	SELECT
														bt.eCodTransaccion,
														bt.fhFecha,
														(cc.tNombres + ' ' + cc.tApellidos) as Cliente,
														(SELECT COUNT(*) FROM BitRegistros WHERE eCodTransaccion = bt.eCodTransaccion) as Compras
														FROM
														BitTransacciones bt
														INNER JOIN CatClientes cc ON cc.eCodCliente = bt.eCodCliente
														ORDER BY bt.eCodTransaccion DESC LIMIT 0,15";
											$rsPublicaciones = mysql_query($select);
											while($rPublicacion = mysql_fetch_array($rsPublicaciones))
											{
												?>
											<tr>
                                                <td><?=sprintf("%07d",$rPublicacion{'eCodTransaccion'})?></td>
                                                <td><?=date('d/m/Y',strtotime($rPublicacion{'fhFecha'}))?></td>
												<td><?=utf8_decode($rPublicacion{'Cliente'})?></td>
												<td class="text-right"><?=sprintf("%07d",$rPublicacion{'Compras'})?></td>
                                                <td class="text-right"> 
													<button type="button" class="btn btn-secondary mb-1" data-toggle="modal" data-target="#detTran<?=$rPublicacion{'eCodTransaccion'}?>">
														Detalles
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

<?
											$select = "	SELECT
														bt.eCodTransaccion,
														bt.fhFecha,
														(cc.tNombres + ' ' + cc.tApellidos) as Cliente,
														(SELECT COUNT(*) FROM BitRegistros WHERE eCodTransaccion = bt.eCodTransaccion) as Compras
														FROM
														BitTransacciones bt
														INNER JOIN CatClientes cc ON cc.eCodCliente = bt.eCodCliente
														ORDER BY bt.eCodTransaccion DESC LIMIT 0,15";
											$rsPublicaciones = mysql_query($select);
											while($rPublicacion = mysql_fetch_array($rsPublicaciones))
											{
												?>
<!-- modal medium -->
			<div class="modal fade" id="mediumModal" tabindex="-1" role="dialog" aria-labelledby="mediumModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="mediumModalLabel">Transaccion #<?=sprintf("%07d",$rPublicacion{'eCodTransaccion'})?></h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<?
											$select = "	SELECT 
															cc.*, 
															ce.tNombre as estatus
														FROM
															Catclientes cc
														INNER JOIN CatEstatus ce ON cc.eCodEstatus = ce.eCodEstatus ORDER BY cc.eCodCliente ASC";
											$rsPublicaciones = mysql_query($select);
											$rPublicacion = mysql_fetch_array($rsPublicaciones)
												?>
							<p>
											Cliente: 
                                                <?=utf8_decode($rPublicacion{'tTitulo'})?>
												<?=utf8_decode($rPublicacion{'tNombres'})?>
												<?=utf8_decode($rPublicacion{'tApellidos'})?><br>
											E-mail: 
												<?=utf8_decode($rPublicacion{'tCorreo'})?><br>
											Tel&eacute;fono: 
												<?=utf8_decode($rPublicacion{'tTelefonoFijo'})?>
							</p>
							<table>
							<thead>
								<tr>
									<td><b>Curso / Evento</b></td>
									<td><b>Monto</b></td>
									<td><b>Factura</b></td>
								</tr>
							</thead>
								<tbody>
								<?
								$select = "	SELECT 
												br.*,
												bp.*
											FROM
												BitRegistros br
											INNER JOIN BitPublicaciones bp ON bp.eCodPublicacion=br.eCodPublicacion
											WHERE
												br.eCodTransaccion = ".$rPublicacion{'eCodTransaccion'};
								$rsCarrito = mysql_query($select);
								while($rCarrito = mysql_fetch_array($rsCarrito))
								{
									?>
									<tr>
										<td><?=utf8_decode($rCarrito{'tTitulo'})?></td>
										<td>$<?=number_format($rCarrito{'tTitulo'},2,'.',',')?></td>
										<td><?=$rCarrito{'bFactura'} ? 'SI' : 'NO' ?></td>
									</tr>
									<?
								}
								?>
								</tbody>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
						</div>
					</div>
				</div>
			</div>
			<!-- end modal medium -->
<?
											}
?>