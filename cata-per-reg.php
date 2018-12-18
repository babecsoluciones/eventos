<?php
require_once("cnx/swgc-mysql.php");
require_once("cls/cls-sistema.php");
$clSistema = new clSis();
session_start();
if($_POST)
{
	$eCodPerfil = $_POST['eCodPerfil'] ? $_POST['eCodPerfil'] : false;
    if(!$eCodPerfil)
    {
        $tNombre = "'".$_POST['tNombre']."'";
        $insert = "INSERT INTO SisPerfiles (tNombre) VALUES($tNombre)";
        $rsNuevo = mysql_query($insert);
        $eCodPerfil = mysqli_insert_id();
    }
	mysql_query("DELETE FROM SisSeccionesPerfiles WHERE eCodPerfil = $eCodPerfil");
	foreach($_POST['tCodSeccion'] as $key => $tCodSeccion)
	{
		$tCodSeccion = "'".$tCodSeccion."'";
		$bAll = $_POST['bAll'][$key];
		mysql_query("INSERT INTO SisSeccionesPerfiles (eCodPerfil, tCodSeccion, bAll) VALUES ($eCodPerfil, $tCodSeccion, $bAll)");
	}
	echo '<script>window.location="?tCodSeccion=cata-per-sis";</script>';
}
?>
<div class="row">
	<div class="col-lg-12">
        <button type="button" class="btn btn-primary" onclick="activarValidacion()" id="btnValidar">
            <i class="fa fa-key" ></i></button>
	<input type="hidden" id="tPasswordVerificador"  style="display:none;" value="<?=base64_decode($_SESSION['sessionAdmin'][0]['tPasswordOperaciones'])?>">
        <input type="password" class="form-control col-md-3" onkeyup="validarUsuario()"  id="tPasswordOperaciones"  style="display:none;" size="8">
        <button type="button" id="btnGuardar" class="btn btn-primary" disabled onclick="guardar()"><i class="fa fa-floppy-o"></i> Guardar</button>
	</div>
</div>
<form action="?tCodSeccion=<?=$_GET['tCodSeccion']?>" method="post" id="datos">
	<input type="hidden" name="eAccion" id="eAccion" value="">
<div class="row">
                            <div class="col-lg-4">
                                <h2 class="title-1 m-b-25">Modificar permisos</h2>
                                <div class="table-responsive table--no-card m-b-40">
                                    <table class="table table-borderless table-striped table-earning">
                                        <tr>
											<td>Perfil</td>
											<td>
													<?
														$select = "SELECT * FROM SisPerfiles WHERE eCodPerfil = ".$_GET['eCodPerfil']." ORDER BY tNombre ASC";
	  													$rsPerfiles = mysql_query($select);
	  													$rPerfil = mysql_fetch_array($rsPerfiles);
													?>
												<input type="hidden" name="eCodPerfil" id="eCodPerfil" value="<?=$_GET['eCodPerfil']?>">
												<input type="text" class="form-control" name="tNombre" id="tNombre" value="<?=$rPerfil['tNombre']?>" <?=$_GET['eCodPerfil'] ? 'readonly' : ''?>>
											</td>
										</tr>
                                    </table>
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <h2 class="title-1 m-b-25">Secciones</h2>
                                <div class="table-responsive table--no-card m-b-40">
                                    <div class="au-card-inner">
                                        <div class="table-responsive">
                                            <table class="table table-borderless table-striped">
                                                <tbody>
													<?
													$select = "SELECT * FROM SisSecciones ORDER BY ePosicion ASC";
													$rsSecciones = mysql_query($select);
													$b=0;
													while($rSeccion = mysql_fetch_array($rsSecciones))
													{
                                                        
                                                        $seccion = "SELECT * FROM SisSeccionesPerfiles WHERE eCodPerfil = ".$_GET['eCodPerfil']." AND tCodSeccion = '".$rSeccion{'tCodSeccion'}."'";
                                                        $rsSeccionPerfil = mysql_query($seccion);
                                                        $bSeccion = mysql_num_rows($rsSeccionPerfil) ? true : false;
                                                        
														?>
													<tr>
                                                        <td width="16"><input type="checkbox" name="tCodSeccion[<?=$b?>]" value="<?=$rSeccion{'tCodSeccion'}?>" <?=$bSeccion || !$rSeccion{'tCodPadre'} ? 'checked' : ''?>></td>
                                                        <td colspan="2"><?=$rSeccion{'tTitulo'}?></td>
														<td align="right">
															<? if($rSeccion{'bFiltro'})
														{
															?>
															<label>A <input type="checkbox" name="bAll[<?=$b?>]" value="1" <?=$rSeccion{'tCodSeccion'} ? 'checked' : ''?>></label></td>
															<?
														}
														else
														{
															?>
														<input type="hidden" name="bAll[<?=$b?>]" value="0">
														<?
														}
														?>	
                                                    </tr>
													
													<?
													$b++;
														
													$select2 = "SELECT * FROM SisSecciones WHERE tCodPadre = '".$rSeccion{'tCodSeccion'}."' ORDER BY ePosicion ASC";
													$rsSecciones2 = mysql_query($select2);
													while($rSeccion2 = mysql_fetch_array($rsSecciones2))
														{
														?>
															<tr>
															<td></td>
                                                    	    <td width="16"><input type="checkbox" name="tCodSeccion[<?=$b?>]" value="<?=$rSeccion2{'tCodSeccion'}?>"></td>
                                                    	    <td><?=$rSeccion2{'tTitulo'}?></td>
															<td><input type="hidden" name="bAll[<?=$b?>]" value="0"></td>
                                                    	</tr>
														<?
															$b++;
														}
													
													}
													?>
                                                    
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
	
	</form>