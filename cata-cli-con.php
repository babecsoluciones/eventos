<?php
require_once("cnx/swgc-mysql.php");
require_once("cls/cls-sistema.php");
$clSistema = new clSis();
session_start();
$bAll = $clSistema->validarPermiso($_GET['tCodSeccion']);
?>
<script>
function detalles(eCodCliente)
    {
        window.location="?tCodSeccion=cata-cli-det&eCodCliente="+eCodCliente;
    }
</script>
<div class="row">
	<div class="col-lg-12">
        <? if($clSistema->validarEnlace('cata-cli-reg')) { ?>
	<button type="button" class="btn btn-primary" onclick="window.location='?tCodSeccion=cata-cli-reg'"><i class="fa fa-plus"></i> Nuevo Cliente</button>
        <? } ?>
	</div>
</div>
<div class="row">
                            <div class="col-lg-12">
                                <h2 class="title-1 m-b-25">Clientes</h2>
                                <div style="text-align:right;">
                                    <input type='search' id='txt_searchall' placeholder='Búsqueda rápida...'> 
						
						<!-- Script -->
        <script type='text/javascript'>
            $(document).ready(function(){

                // Search all columns
                $('#txt_searchall').keyup(function(){
                    // Search Text
                    var search = $(this).val();

                    // Hide all table tbody rows
                    $('table tbody tr').hide();

                    // Searching text in columns and show match row
                    $('table tbody tr td:contains("'+search+'")').each(function(){
                        $(this).closest('tr').show();
                    });
                    
                });

                // Search on name column only
                $('#txt_name').keyup(function(){
                    // Search Text
                    var search = $(this).val();

                    // Hide all table tbody rows
                    $('table tbody tr').hide();

                    // Searching text in columns and show match row
                    $('table tbody tr td:nth-child(2):contains("'+search+'")').each(function(){
                        $(this).closest('tr').show();
                    });
                    
                });
               
            });

            // Case-insensitive searching (Note - remove the below script for Case sensitive search )
            $.expr[":"].contains = $.expr.createPseudo(function(arg) {
                return function( elem ) {
                    return $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0;
                };
            });
        </script>
                                    </div>
                                <div class="table-responsive table--no-card m-b-40" style="max-height:500px; overflow-y: scroll;">
                                    <table class="table table-borderless table-striped table-earning">
                                        <thead>
                                            <tr>
												<th>E</th>
												<th></th>
                                                <th>Nombre</th>
                                                <th>Apellidos</th>
                                                <th class="text-right">Correo</th>
                                                <th class="text-right">Tel&eacute;fono</th>
												<th class="text-right">Fecha de registro</th>
												<th class="text-right">Promotor</th>
                                                <th class="text-right"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
											<?
											$select = "	SELECT 
															cc.*, 
															ce.tNombre as estatus,
															su.tNombre as promotor
														FROM
															CatClientes cc
														INNER JOIN CatEstatus ce ON cc.eCodEstatus = ce.eCodEstatus
														LEFT JOIN SisUsuarios su ON su.eCodUsuario = cc.eCodUsuario".
												($bAll ? "" : " WHERE cc.eCodUsuario = ".$_SESSION['sessionAdmin'][0]['eCodUsuario']).
														" ORDER BY cc.eCodCliente ASC";
											$rsPublicaciones = mysql_query($select);
											while($rPublicacion = mysql_fetch_array($rsPublicaciones))
											{
												?>
											<tr>
                                                <td><?=substr(utf8_decode(strtoupper($rPublicacion{'estatus'})),0,2)?></td>
                                                <td><?=utf8_decode($rPublicacion{'tTitulo'})?></td>
												<td><?=utf8_decode($rPublicacion{'tNombres'})?></td>
												<td><?=utf8_decode($rPublicacion{'tApellidos'})?></td>
												<td><?=utf8_decode($rPublicacion{'tCorreo'})?></td>
												<td><?=utf8_decode($rPublicacion{'tTelefonoFijo'})?></td>
                                                <td><?=date('d/m/Y',strtotime($rPublicacion{'fhFechaCreacion'}))?></td>
												<td><?=utf8_decode($rPublicacion{'promotor'})?></td>
                                                <td class="text-right"> 
													<button onclick="detalles(<?=$rPublicacion{'eCodCliente'}?>)"><i class="fa fa-eye"></i></button> 
													<button onclick="window.location='?tCodSeccion=cata-cli-reg&eCodCliente=<?=$rPublicacion{'eCodCliente'}?>'"><i class="fa fa-pencil-square-o"></i></button>
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