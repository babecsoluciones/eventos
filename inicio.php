<?php
require_once("cnx/swgc-mysql.php");
require_once("cls/cls-sistema.php");
$clSistema = new clSis();
session_start();

$bAll = $clSistema->validarPermiso($_GET['tCodSeccion']);

$fhFechaInicio = $_POST['fhFechaConsulta'] ? date('Y-m-d',strtotime($_POST['fhFechaConsulta'])).' 00:00:00' : date('Y-m-d').' 00:00:00';
$fhFechaTermino = $_POST['fhFechaConsulta'] ? date('Y-m-d',strtotime($_POST['fhFechaConsulta'])).' 23:59:59' : date('Y-m-d').' 23:59:59';

$fhFechaInicio = "'".$fhFechaInicio."'";
$fhFechaTermino = "'".$fhFechaTermino."'";

$select = "SELECT be.*, cc.tNombres nombreCliente, cc.tApellidos apellidosCliente,
															su.tNombre as promotor, ce.tNombre Estatus FROM BitEventos be INNER JOIN CatClientes cc ON cc.eCodCliente = be.eCodCliente
															INNER JOIN CatEstatus ce ON ce.eCodEstatus = be.eCodEstatus
														LEFT JOIN SisUsuarios su ON su.eCodUsuario = be.eCodUsuario
                                                        WHERE
                                                        be.fhFechaEvento between $fhFechaInicio AND $fhFechaTermino".
												($bAll ? "" : " AND cc.eCodUsuario = ".$_SESSION['sessionAdmin'][0]['eCodUsuario']).
														" ORDER BY be.fhFechaEvento DESC";
$rsEventos = mysql_query($select);
?>

<div class="row">
<!--calendario-->
    <div class="col-lg-4" >
        <div class="au-card au-card--no-shadow au-card--no-pad m-b-40" id="datepicker"></div>
    </div>
<!--calendario-->
<!--Listado de eventos de ese día-->
<div class="col-lg-8">
                                <div class="au-card au-card--no-shadow au-card--no-pad m-b-40">
                                    <div class="au-card-title" style="background-image:url('images/bg-title-01.jpg');">
                                        <div class="bg-overlay bg-overlay--blue"></div>
                                        <h3>
                                            <i class="zmdi zmdi-account-calendar"></i>Eventos del d&iacute;a</h3>
                                        <button class="au-btn-plus" onclick="window.location='index.php?tCodSeccion=oper-eve-reg'" alt="Nuevo Evento">
                                            <i class="zmdi zmdi-plus"></i>
                                        </button>
                                    </div>
                                    <div class="au-task js-list-load">
                                        <div class="au-task__title">
                                            <p><?=date('d/m/Y',strtotime($fhFechaInicio))?></p>
                                        </div>
                                        <div class="au-task-list js-scrollbar3">
                                            <?
                                                if(mysql_num_rows($rsEventos))
                                                {
                                                    while($rEvento = mysql_fetch_array($rsEventos))
                                                    {
                                                        ?>
                                                <div class="au-task__item au-task__item--primary">
                                                    <div class="au-task__item-inner">
                                                        <h5 class="task">
                                                            <a href="#"><?=$rEvento{'nombreCliente'}.' '.$rEvento{'apellidosCliente'}?></a>
                                                        </h5>
                                                        <span class="time"><?=$rEvento{'Estatus'}?></span>
                                                        <span class="time"><?=date('d/m/Y',strtotime($rEvento{'fhFechaEvento'}))?> (<?=date('H:i',strtotime($rEvento{'fhFechaEvento'}))?>)</span>
                                                    </div>
                                                </div>
                                            <?
                                                    }
                                                }
                                                else
                                                {
                                                    echo '<h2>No se han encontrado eventos en la fecha seleccionada</h2>';
                                                }
                                            ?>
                                        </div>
                                    </div>
                                </div>
                            </div>   
<!--Listado de eventos de ese día-->
<form id="Datos" method="post">
    <input type="hidden" name="fhFechaConsulta" id="datepicker1">
    </form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
<script src="https://rawgithub.com/cletourneau/angular-bootstrap-datepicker/master/dist/angular-bootstrap-datepicker.js" charset="utf-8"></script>
<script>
$('#datepicker').datepicker();


function obtenerFecha()
{
var fecha = $("#datepicker").datepicker( 'getDate' );
var fhFecha = new Date(fecha);
document.getElementById('datepicker1').value = fhFecha.getDate()+'-'+fhFecha.getMonth()+'-'+fhFecha.getFullYear();
    document.getElementById('Datos').submit();
}
</script>