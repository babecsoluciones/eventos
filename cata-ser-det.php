<?php
require_once("cnx/swgc-mysql.php");
require_once("cls/cls-sistema.php");
$clSistema = new clSis();
session_start();
$select = "SELECT * FROM CatServicios WHERE eCodServicio = ".$_GET['eCodServicio'];
$rsCliente = mysql_query($select);
$rCliente = mysql_fetch_array($rsCliente);
?>
<div class="row">
	<div class="col-lg-12">
        <? if($clSistema->validarEnlace('cata-ser-con')) { ?>
	<button type="button" class="btn btn-primary" onclick="window.location='?tCodSeccion=cata-ser-con'"><i class="fa fa-arrow-left"></i> Volver al cat&aacute;logo</button>
        <? } ?>
	</div>
</div>
<div class="row">
                            <div class="col-lg-12">
                                <h2 class="title-1 m-b-25">Detalles del Cliente</h2>
                                
                                    <table class="table">
                                        <tr>
                                            <td>Nombre</td>
                                            <td><?=$rCliente{'tNombre'}?></td>
                                            <td>Descripci&oacute;n</td>
                                            <td><?=$rCliente{'tDescripcion'}?></td>
                                        </tr>
                                        <tr>
                                            <td>Precio de Venta</td>
                                            <td colspan="4">$<?=$rCliente{'dPrecioVenta'}?></td>
                                        </tr>
                                        
                                    </table>
                                
                            </div>
	
							<div class="col-lg-12">
                                
                                
                                    <table width="100%" class="table">
		   <thead>
			   <tr>
				   
			   <td width="95%">Inventario</td>
				   <td>Piezas</td>
			   </tr>
			   </thead>
			   <tbody>
			  <?
											$select = "	SELECT 
															cti.tNombre as tipo, 
															ci.*,
															rti.ePiezas as unidad
														FROM
															CatInventario ci
															INNER JOIN CatTiposInventario cti ON cti.eCodTipoInventario = ci.eCodTipoInventario
															INNER JOIN RelServiciosInventario rti ON rti.eCodInventario=ci.eCodInventario
															WHERE
																rti.eCodServicio = ".$_GET['eCodServicio']."
															ORDER BY ci.tNombre ASC";

											$rsPublicaciones = mysql_query($select);
		   									
											while($rPublicacion = mysql_fetch_array($rsPublicaciones))
											{
												
												?>
											<tr>
												
												<td>
												<?=utf8_decode($rPublicacion{'tipo'})?> | <?=utf8_decode($rPublicacion{'tNombre'})?> | <?=utf8_decode($rPublicacion{'tMarca'})?>
												</td>
												<td>
													<?=$rPublicacion{'unidad'}?>
												</td>
                                            </tr>
											<?
													
											}
											?>
			   </tbody>
										</table>
                                
                            </div>
                        </div>