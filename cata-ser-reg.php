<?php
require_once("cnx/swgc-mysql.php");
require_once("cls/cls-sistema.php");
$clSistema = new clSis();
session_start();

$select = "SELECT * FROM CatServicios WHERE eCodServicio = ".$_GET['eCodServicio'];
$rsPublicacion = mysql_query($select);
$rPublicacion = mysql_fetch_array($rsPublicacion);

?>
<?
if($_POST)
{
    $res = $clSistema -> registrarServicio();
    
    if($res)
    {
        ?>
            <div class="alert alert-success" role="alert">
                El paquete se guard&oacute; correctamente!
            </div>
<script>
setTimeout(function(){
    window.location="?tCodSeccion=cata-ser-con";
},2500);
</script>
<?
    }
    else
    {
  ?>
            <div class="alert alert-danger" role="alert">
                Error al procesar la solicitud!
            </div>
<?
    }
}
?>

<script>
function validar()
{
var bandera = false;
var mensaje = "";
var tNombre = document.getElementById("tNombre");
var tDescripcion = document.getElementById("tDescripcion");
var dPrecio = document.getElementById("dPrecio");

    if(!tNombre.value)
    {
        mensaje += "* Nombre\n";
        bandera = true;
    };
    if(!tDescripcion.value)
    {
        mensaje += "* Descripcion\n";
        bandera = true;
    };
    if(!dPrecio.value)
    {
        mensaje += "* Precio\n";
        bandera = true;
    };
    
    
    
    if(!bandera)
    {
        guardar();
    }
    else
    {
        alert("<- Favor de revisar la siguiente información ->\n"+mensaje)
    }
}
   
</script>
    
<div class="row">
	<div class="col-lg-12">
        <button type="button" class="btn btn-primary" onclick="activarValidacion()" id="btnValidar">
            <i class="fa fa-key" ></i></button>
	<input type="hidden" id="tPasswordVerificador"  style="display:none;" value="<?=base64_decode($_SESSION['sessionAdmin'][0]['tPasswordOperaciones'])?>">
        <input type="password" class="form-control col-md-3" onkeyup="validarUsuario()"  id="tPasswordOperaciones"  style="display:none;" size="8">
        <button type="button" id="btnGuardar" class="btn btn-primary" disabled onclick="validar()"><i class="fa fa-floppy-o"></i> Guardar</button>
	</div>
</div>
<div class="row">
    <div class="col-lg-12">
    <form id="datos" name="datos" action="<?=$_SERVER['REQUEST_URI']?>" method="post" enctype="multipart/form-data">
        <input type="hidden" name="eCodServicio" value="<?=$_GET['eCodServicio']?>">
        <input type="hidden" name="eAccion" id="eAccion">
                            <div class="col-lg-12">
								<h2 class="title-1 m-b-25"><?=$_GET['eCodServicio'] ? 'Actualizar ' : '+ '?>Paquete</h2>
                                <div class="card col-lg-12">
                                    
                                    <div class="card-body card-block">
                                        <!--campos-->
                                        <div class="form-group">
              
           </div>
           <div class="form-group">
              <label>Nombre</label>
              <input type="text" class="form-control" name="tNombre" id="tNombre" placeholder="Nombre" value="<?=utf8_encode($rPublicacion{'tNombre'})?>" >
           </div>
           <div class="form-group">
              <label>Descripci&oacute;n</label>
              <textarea class="form-control" name="tDescripcion" id="tDescripcion" placeholder="Descripci&oacute;n" rows="5" style="resize:none;"><?=utf8_decode($rPublicacion{'tDescripcion'})?></textarea>
           </div>
           <div class="form-group">
              <label>Precio de Venta</label>
              <input type="text" class="form-control" name="dPrecio" id="dPrecio" placeholder="Precio de Venta" value="<?=($rPublicacion{'dPrecioVenta'})?>" >
			   <div><sup>Solo números. Ej. 1200.00</sup></div>
           </div>
           
                                        <!--campos-->
                                    </div>
                                </div>
                            </div>
        
        <!--tabs-->
        <?
    $select = "SELECT * FROM CatTiposInventario ORDER BY tNombre DESC";
           $rsTipos = mysql_query($select);
           $tipos = array();
           while($rTipo = mysql_fetch_array($rsTipos))
           {
               $tipos[] = array('eCodTipoInventario'=>$rTipo{'eCodTipoInventario'},'tNombre'=>$rTipo{'tNombre'});
           }
    ?>
        <div class="custom-tab">

											<nav>
												<div class="nav nav-tabs" id="nav-tab" role="tablist">
                                                    <?
                                                    for($i=0;$i<sizeof($tipos);$i++)
                                                    {
                                                        ?>
                                                    <a class="nav-item nav-link active" id="custom-nav-home-tab" data-toggle="tab" href="#custom-nav-<?=$tipos[$i]['eCodTipoInventario']?>" role="tab" aria-controls="custom-nav-<?=$tipos[$i]['eCodTipoInventario']?>"
													 aria-selected="true"><?=$tipos[$i]['tNombre']?></a>
                                                    <?
                                                    }
                                                    ?>
												</div>
											</nav>
											<div class="tab-content pl-3 pt-2" id="nav-tabContent">
                                                <?
                                                $b=0;
                                                    for($i=0;$i<sizeof($tipos);$i++)
                                                    {
                                                        ?>
                                                    <div class="tab-pane fade show active" id="custom-nav-<?=$tipos[$i]['eCodTipoInventario']?>" role="tabpanel" aria-labelledby="custom-nav-home-tab">
													
                                                        <!--tablas-->
                                                        <div class="table-data__tool">
                                    <div class="table-data__tool-left">
                                        
                                        
                                    </div>
                                    <div class="table-data__tool-right">
                                       <input class="au-input" id='search<?=$i?>' placeholder='Búsqueda rápida...'> 
                                        
                                        <script type="text/javascript">


    $(window).load(function(){
      
var $rows = $('#table<?=$i?> tbody tr');
$('#search<?=$i?>').keyup(function() {
    var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
    
    $rows.show().filter(function() {
        var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
        return !~text.indexOf(val);
    }).hide();
});

    });

</script>
                                        
                                    </div>
                                </div>
		<div class="table-responsive table--no-card m-b-40" style="max-height:500px; overflow-y: scroll;">
                                    <table class="table table-borderless table-striped table-earning" id="table<?=$i?>">
                                        <thead>
                                            <tr>
				   <th width="2%"></th>
			   <th width="95%">Inventario</th>
				   <th>Piezas</th>
			   </tr>
                                        </thead>
                                        <tbody>
											<?
											$select = "	SELECT 
															cti.tNombre as tipo, 
															ci.*
														FROM
															CatInventario ci
															INNER JOIN CatTiposInventario cti ON cti.eCodTipoInventario = ci.eCodTipoInventario".
														" WHERE ci.eCodTipoInventrio = ".$tipos[$i]['eCodTipoInventario'].
														" ORDER BY ci.tNombre ASC";
											$rsPublicaciones = mysql_query($select);
		   									
											while($rPublicacion = mysql_fetch_array($rsPublicaciones))
											{
												$select = "SELECT * FROM RelServiciosInventario WHERE eCodInventario = ".$rPublicacion{'eCodInventario'}." AND eCodServicio = ".$_GET['eCodServicio'];
												$rServicio = mysql_fetch_array(mysql_query($select));
												?>
											<tr>
												<td>
													
                                                        <input type="checkbox" id="eCodInventario<?=$b?>" name="eCodInventario[<?=$b?>]" value="<?=$rPublicacion{'eCodInventario'}?>" <?=($rServicio{'eCodInventario'}) ? 'checked' : ''?>>
                                                        
												</td>
												<td>
												<?=utf8_decode($rPublicacion{'tipo'})?> | <?=utf8_decode($rPublicacion{'tNombre'})?> | <?=utf8_decode($rPublicacion{'tMarca'})?>
												</td>
												<td>
													<input type="text" size="4" name="ePiezas[<?=$b?>]" id="ePiezas<?$b?>" class="form-control" placeholder="10" value="<?=$rServicio{'ePiezas'}?>">
												</td>
                                            </tr>
											<?
													$b++;
											}
											?>
                                        </tbody>
                                    </table>
                                </div>
                                                        <!--tablas-->
                                                        
												</div>
                                                    <?
                                                    }
                                                    ?>
												
											</div>

										</div>
        <!--tabs-->
		
		
		 		
    </form>
    </div>
                        </div>