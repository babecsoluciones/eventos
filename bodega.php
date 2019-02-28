<?php

//error_reporting(E_ALL);
//ini_set('display_errors', 1);

require_once("cnx/swgc-mysql.php");
require_once("cls/cls-sistema.php");
$clSistema = new clSis();
session_start();

$bAll = $clSistema->validarPermiso($_GET['tCodSeccion']);

$fhFechaInicio = $_POST['fhFechaConsulta'] ? date('Y-m-d',strtotime("+1 month",strtotime($_POST['fhFechaConsulta']))).' 00:00:00' : date('Y-m-d').' 00:00:00';
$fhFechaTermino = $_POST['fhFechaConsulta'] ? date('Y-m-d',strtotime("+1 month",strtotime($_POST['fhFechaConsulta']))).' 23:59:59' : date('Y-m-d').' 23:59:59';

$fhFechaConsulta = $_POST['fhFechaConsulta'] ? date('Y-m-d',strtotime("+1 month",strtotime($_POST['fhFechaConsulta']))).' 00:00:00' : date('Y-m-d').' 00:00:00';

$fhFechaInicio = "'".$fhFechaInicio."'";
$fhFechaTermino = "'".$fhFechaTermino."'";

function detalle($eCodEvento)
{
      $select = "SELECT be.*, (cc.tNombres + ' ' + cc.tApellidos) as tNombre FROM BitEventos be INNER JOIN CatClientes cc ON cc.eCodCliente = be.eCodCliente WHERE be.eCodEvento = ".$eCodEvento;
$rsPublicacion = mysql_query($select);
$rPublicacion = mysql_fetch_array($rsPublicacion);

//clientes
$select = "	SELECT 
				cc.*, 
				su.tNombre as promotor
			FROM
				CatClientes cc
			
			LEFT JOIN SisUsuarios su ON su.eCodUsuario = cc.eCodUsuario
            ORDER BY cc.eCodCliente ASC";
$rsClientes = mysql_query($select);

?>

        <table class="table table-responsive table-borderless table-top-campaign">
            <tr>
                <td>
                                Evento # <?=sprintf("%07d",$rEvento{'eCodEvento'})?><br>
                                Fecha: <?=date('d/m/Y H:i',strtotime($rPublicacion{'fhFechaEvento'}))?><br>
                                Hora de Montaje: <?=$rPublicacion{'tmHoraMontaje'}?>       
                </td>
            </tr>
            <tr>
                <td>  
                                 <?
     while($rPaquete = mysql_fetch_array($rsClientes))
{ ?>
                  <?=($rPublicacion{'eCodCliente'}==$rPaquete{'eCodCliente'}) ? $rPaquete{'tNombres'}.' '.$rPaquete{'tApellidos'}.' <br>'.$rPaquete{'tCorreo'}.'<br>Tel.'.$rPaquete{'tTelefonoFijo'}.'<br>Cel.'.$rPaquete{'tTelefonoMovil'} : ''?>
                  <?
} ?>
                            </td>
            </tr>
            <tr>
                            <td>
                                <?=nl2br(base64_decode(utf8_decode($rPublicacion{'tDireccion'})))?>
                            </td>
            </tr>
            <tr>
                <td>
                    Descripci&oacute;n
                </td>
            </tr>
											<?
                                            $i = 0;
											$select = "	SELECT DISTINCT
															cs.tNombre,
                                                            cs.dPrecioVenta,
                                                            rep.eCodServicio,
                                                            rep.eCantidad,
                                                            cs.eCodServicio,
                                                            rep.dMonto
                                                        FROM CatServicios cs
                                                        INNER JOIN RelEventosPaquetes rep ON rep.eCodServicio = cs.eCodServicio and rep.eCodTipo = 1
                                                        WHERE rep.eCodEvento = ".$eCodEvento;
											$rsPublicaciones = mysql_query($select);
                                            $dTotalEvento = 0;
											while($rPublicacion = mysql_fetch_array($rsPublicaciones))
											{
												?>
											<tr>
                <td>
                    <b><?=$rPublicacion{'eCantidad'}?></b> - <?=utf8_decode($rPublicacion{'tNombre'})?><br>
                    <?
                        $select = "SELECT ci.tNombre, rsi.ePiezas FROM CatInventario ci INNER JOIN RelServiciosInventario rsi ON rsi.eCodInventario=ci.eCodInventario WHERE rsi.eCodServicio = ".$rPublicacion{'eCodServicio'};
                                                $rsDetalle = mysql_query($select);
                                                while($rDetalle = mysql_fetch_array($rsDetalle))
                                                { ?>
                        <b>x<?=$rDetalle{'ePiezas'}?></b> - <?=($rDetalle{'tNombre'})?><br>
                                            <? } ?>
                </td>
            </tr>
											<?
											$i++;
                                                $dTotalEvento = $dTotalEvento + ($rPublicacion{'dMonto'});
											}
                                            $select = "	SELECT DISTINCT
															cs.tNombre,
                                                            cs.dPrecioVenta,
                                                            rep.eCodServicio,
                                                            rep.eCantidad,
                                                            rep.dMonto
                                                        FROM CatInventario cs
                                                        INNER JOIN RelEventosPaquetes rep ON rep.eCodServicio = cs.eCodInventario and rep.eCodTipo = 2
                                                        WHERE rep.eCodEvento = ".$eCodEvento;
											$rsPublicaciones = mysql_query($select);
                                            
											while($rPublicacion = mysql_fetch_array($rsPublicaciones))
											{ ?>
											<tr>
                <td>
                    <b><?=$rPublicacion{'eCantidad'}?></b> - <?=utf8_decode($rPublicacion{'tNombre'})?>
                </td>
                
            </tr>
											<? } ?>
            
        </table>

<?
}


?>

<div class="row">
<!--calendario-->
    <div class="col-lg-12 au-card au-card--no-shadow au-card--no-pad m-b-40" >
        <div id="datepicker" onclick="obtenerFecha()"></div>
        <center>
        <form id="Datos" method="post" action="<?=$_SERVER['PHP_SELF']?>?tCodSeccion=bodega">
    <input type="hidden" name="fhFechaConsulta" id="datepicker1">
    <input type="submit" class="btn btn-info" value="Consultar">
    </form>
        </center>
    </div>
<!--calendario-->
<!--Listado de eventos de ese día-->

    <?
    $b=0;
              
     $lstTiposDocumentos = array();
     $lstTiposDocumentos[] = array('eCodTipoDocumento'=>1,'tNombre'=>'Eventos','enlace'=>'eve','fondo'=>'eventos.png');
     $lstTiposDocumentos[] = array('eCodTipoDocumento'=>2,'tNombre'=>'Rentas','enlace'=>'ren','fondo'=>'rentas.png');
              
    for($i=0;$i<sizeof($lstTiposDocumentos);$i++)
    {
    
    $eCodTipoDocumento =   $lstTiposDocumentos[$i]['eCodTipoDocumento'];  
    $tNombre =  $lstTiposDocumentos[$i]['tNombre'];  
    $tEnlace =  $lstTiposDocumentos[$i]['enlace']; 
    $tFondo =  $lstTiposDocumentos[$i]['fondo']; 
    $select = "SELECT be.*, cc.tNombres nombreCliente, cc.tApellidos apellidosCliente,
															su.tNombre as promotor, ce.tNombre Estatus, ce.tIcono FROM BitEventos be INNER JOIN CatClientes cc ON cc.eCodCliente = be.eCodCliente
															INNER JOIN CatEstatus ce ON ce.eCodEstatus = be.eCodEstatus
														LEFT JOIN SisUsuarios su ON su.eCodUsuario = be.eCodUsuario
                                                        WHERE
                                                        be.fhFechaEvento between $fhFechaInicio AND $fhFechaTermino".
                                                        " AND be.eCodEstatus<>4".
                                                        " AND be.eCodTipoDocumento=$eCodTipoDocumento".
												        ($bAll ? "" : " AND cc.eCodUsuario = ".$_SESSION['sessionAdmin'][0]['eCodUsuario']).
														" ORDER BY be.fhFechaEvento DESC";
														
$rsEventos = mysql_query($select);
    ?>
    
    <div class="col-md-6">
                                <div class="card">
                                    <div class="card-header">
                                        <strong class="card-title">
                                            <i class="zmdi zmdi-account-calendar"></i> <?=$tNombre?> del d&iacute;a
                                            
                                        </strong>
                                    </div>
                                    <div class="card-body">
                                        <?
                                                if(mysql_num_rows($rsEventos))
                                                {
                                                    while($rEvento = mysql_fetch_array($rsEventos))
                                                    {
                                                        ?>
                                        <div class="col-md-12">
                                <div class="card border border-primary">
                                    <div class="card-header">
                                        <strong class="card-title">
                                         <i class="<?=$rEvento{'tIcono'}?>"></i> <?=$rEvento{'nombreCliente'}.' '.$rEvento{'apellidosCliente'}?>
                                        </strong>
                                    </div>
                                    <div class="card-body">
                                        <p class="card-text">
                                            Direcci&oacute;n: <?=base64_decode($rEvento{'tDireccion'})?><br>
                                            Estatus: <i class="<?=$rEvento{'tIcono'}?>"></i> <?=$rEvento{'Estatus'}?><br>
                                            Fecha: <?=date('d/m/Y H:i',strtotime($rEvento{'fhFechaEvento'}))?><br>
                                           
                                        </p>
                                        <br>
                                        <table width="100%">
                                        <tr>
                                            <td align="center">
                                            <button id="mtrDet<?=$b?>" onclick="mostrar(<?=$b?>)"><i class="fa fa-eye"></i> [+] Detalles </button>
                                            <button id="ocuDet<?=$b?>" onclick="ocultar(<?=$b?>)" style="display:none"><i class="fa fa-eye"></i> [-] Detalles</button>
                                            </td>
                                            
                                            </tr>
                                        </table>
                                        
                                        <div id="detalle<?=$b?>" style="display:none">
                                        <!--imprimimos detalle-->
                                          <? detalle($rEvento{'eCodEvento'}); ?>
                                            <!--imprimimos detalle-->
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                                            <?
                                                        $b++;
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
    
                                
    <?
    }
    ?>
                            
<!--Listado de eventos de ese día-->

</div>



<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
<script src="https://rawgithub.com/cletourneau/angular-bootstrap-datepicker/master/dist/angular-bootstrap-datepicker.js" charset="utf-8"></script>
<script>

function mostrar(indice)
    {
        document.getElementById('mtrDet'+indice).style.display='none';
        document.getElementById('ocuDet'+indice).style.display='inline';
        document.getElementById('detalle'+indice).style.display='inline';
    }
    
function ocultar(indice)
    {
        document.getElementById('mtrDet'+indice).style.display='inline';
        document.getElementById('ocuDet'+indice).style.display='none';
        document.getElementById('detalle'+indice).style.display='none';
    }

function obtenerFecha()
{
var fecha = $("#datepicker").datepicker( 'getDate' );
var fhFecha = new Date(fecha);

var mes = fhFecha.getMonth();
mes = mes+1;
document.getElementById('datepicker1').value = fhFecha;
/*document.getElementById('datepicker1').value = fhFecha.getDate()+'-'+mes+'-'+fhFecha.getFullYear();*/
   window.location="?tCodSeccion=inicio&fhFechaConsulta="+document.getElementById('datepicker1').value;
}
    
    $('#datepicker').datepicker();
</script>