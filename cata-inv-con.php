<?php
require_once("cnx/swgc-mysql.php");
require_once("cls/cls-sistema.php");
$clSistema = new clSis();
session_start();

?>

<script>

function detalles(eCodCliente)
    {
        window.location="?tCodSeccion=cata-inv-det&eCodInventario="+eCodCliente;
    }
</script>
<div class="row">
	<div class="col-lg-12">
        <? if($clSistema->validarEnlace('cata-inv-reg')) { ?>
	<button type="button" class="btn btn-primary" onclick="window.location='?tCodSeccion=cata-inv-reg'"><i class="fa fa-plus"></i> Nuevo Producto</button>
        <? } ?>
	</div>
</div>
<div class="row">
                            <div class="col-lg-12">
                                <h2 class="title-1 m-b-25">Inventario </h2>
                                
                                <div class="table-responsive table--no-card m-b-40" style="max-height:500px; overflow-y: scroll;">
                                    <table class="table table-borderless table-striped table-earning" id="table">
                                        <thead>
                                            <tr>
                                                 <th colspan="8" align="right">
                                                     <input type='search' id='search' placeholder='Búsqueda rápida...'> 
                                                </tdh>
                                            </tr>
                                            <tr>
												<th>Tipo</th>
												<th>Nombre</th>
                                                <th>Marca</th>
                                                <th>Descripci&oacute;n</th>
                                                <th class="text-right">Precio Interno</th>
                                                <th class="text-right">Precio P&uacute;blico</th>
                                                <th class="text-right">Existencia</th>
                                                <th class="text-right"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
											<?
											$select = "	SELECT 
															cti.tNombre as tipo, 
															ci.*
														FROM
															CatInventario ci
															INNER JOIN CatTiposInventario cti ON cti.eCodTipoInventario = ci.eCodTipoInventario
														ORDER BY ci.tNombre ASC";
											$rsPublicaciones = mysql_query($select);
											while($rPublicacion = mysql_fetch_array($rsPublicaciones))
											{
												?>
											<tr>
                                                <td><?=utf8_decode($rPublicacion{'tipo'})?></td>
												<td><?=utf8_decode($rPublicacion{'tNombre'})?></td>
												<td><?=utf8_decode($rPublicacion{'tMarca'})?></td>
												<td><?=substr(utf8_decode($rPublicacion{'tDescripcion'}),0,50)?>...</td>
												<td>$<?=number_format($rPublicacion{'dPrecioInterno'},2)?></td>
												<td>$<?=number_format($rPublicacion{'dPrecioVenta'},2)?></td>
												<td><?=$rPublicacion{'ePiezas'}?></td>
                                                <td class="text-right"> 
													<button onclick="detalles(<?=$rPublicacion{'eCodInventario'}?>)"><i class="fa fa-eye"></i></button> 
													<button onclick="window.location='?tCodSeccion=cata-inv-reg&eCodInventario=<?=$rPublicacion{'eCodInventario'}?>'"><i class="fa fa-pencil-square-o"></i></button>
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