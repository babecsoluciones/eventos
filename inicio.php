<?php
require_once("cnx/swgc-mysql.php");
require_once("cls/cls-sistema.php");
$clSistema = new clSis();
session_start();

?>
<div class="row">
	<div class="col-lg-12">
	<button type="button" class="btn btn-primary"><i class="fa fa-plus"></i> Nueva publicaci&oacute;n</button>
	</div>
</div>
<div class="row">
<!--calendario-->
    <div class="col-lg-4 au-card au-card--no-shadow au-card--no-pad" id="datepicker"></div>
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
                                            <p>[Fecha de Consulta]</p>
                                        </div>
                                        <div class="au-task-list js-scrollbar3">
                                            <div class="au-task__item au-task__item--primary">
                                                <div class="au-task__item-inner">
                                                    <h5 class="task">
                                                        <a href="#">[Nombre del cliente]</a>
                                                    </h5>
                                                    <span class="time">[Estatus]</span>
                                                    <span class="time">[Fecha evento] [Hora Montaje]</span>
                                                </div>
                                            </div>
                                            <div class="au-task__item au-task__item--primary">
                                                <div class="au-task__item-inner">
                                                    <h5 class="task">
                                                        <a href="#">[Nombre del cliente]</a>
                                                    </h5>
                                                    <span class="time">[Estatus]</span>
                                                    <span class="time">[Fecha evento] [Hora Montaje]</span>
                                                </div>
                                            </div>
                                            <div class="au-task__item au-task__item--primary">
                                                <div class="au-task__item-inner">
                                                    <h5 class="task">
                                                        <a href="#">[Nombre del cliente]</a>
                                                    </h5>
                                                    <span class="time">[Estatus]</span>
                                                    <span class="time">[Fecha evento] [Hora Montaje]</span>
                                                </div>
                                            </div>
                                            <div class="au-task__item au-task__item--primary">
                                                <div class="au-task__item-inner">
                                                    <h5 class="task">
                                                        <a href="#">[Nombre del cliente]</a>
                                                    </h5>
                                                    <span class="time">[Estatus]</span>
                                                    <span class="time">[Fecha evento] [Hora Montaje]</span>
                                                </div>
                                            </div>
                                            <div class="au-task__item au-task__item--primary">
                                                <div class="au-task__item-inner">
                                                    <h5 class="task">
                                                        <a href="#">[Nombre del cliente]</a>
                                                    </h5>
                                                    <span class="time">[Estatus]</span>
                                                    <span class="time">[Fecha evento] [Hora Montaje]</span>
                                                </div>
                                            </div>
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
}
</script>