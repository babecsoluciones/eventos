<?php
require_once("cnx/swgc-mysql.php");
require_once("cls/cls-sistema.php");
$clSistema = new clSis();
session_start();
$bAll = $clSistema->validarPermiso($_GET['tCodSeccion']);
$select = "SELECT be.*, (cc.tNombres + ' ' + cc.tApellidos) as tNombre FROM BitEventos be INNER JOIN CatClientes cc ON cc.eCodCliente = be.eCodCliente WHERE be.eCodEvento = ".$_GET['eCodEvento'];
$rsPublicacion = mysql_query($select);
$rPublicacion = mysql_fetch_array($rsPublicacion);

//clientes
$select = "	SELECT 
															cc.*, 
											
															su.tNombre as promotor
														FROM
															CatClientes cc
														
														LEFT JOIN SisUsuarios su ON su.eCodUsuario = cc.eCodUsuario".
												($bAll ? "" : " WHERE cc.eCodUsuario = ".$_SESSION['sessionAdmin'][0]['eCodUsuario']).
														" ORDER BY cc.eCodCliente ASC";
$rsClientes = mysql_query($select);

?>
<?
if($_POST)
{
    $res = $clSistema -> registrarEvento();
    
    if($res)
    {
        ?>
            <div class="alert alert-success" role="alert">
                El evento se guard&oacute; correctamente!
            </div>
<script>
setTimeout(function(){
    window.location="?tCodSeccion=cata-eve-con";
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

<link href="dist/easy-autocomplete.min.css" rel="stylesheet" type="text/css">
<script src="lib/jquery-1.11.2.min.js"></script>
<script src="dist/jquery.easy-autocomplete.min.js" type="text/javascript" ></script>
    
<div class="row">
	<div class="col-lg-12">
        <button type="button" class="btn btn-primary" onclick="activarValidacion()" id="btnValidar">
            <i class="fa fa-key" ></i></button>
	<input type="hidden" id="tPasswordVerificador"  style="display:none;" value="<?=base64_decode($_SESSION['sessionAdmin'][0]['tPasswordOperaciones'])?>">
        <input type="password" class="form-control col-md-3" onkeyup="validarUsuario()"  id="tPasswordOperaciones"  style="display:none;" size="8">
        <button type="button" id="btnGuardar" class="btn btn-primary" disabled onclick="guardar()"><i class="fa fa-floppy-o"></i> Guardar</button>
	</div>
</div>
<div class="row">
    <div class="col-lg-12">
    <form id="datos" name="datos" action="<?=$_SERVER['REQUEST_URI']?>" method="post" enctype="multipart/form-data">
        <input type="hidden" name="eCodEvento" value="<?=$_GET['eCodEvento']?>">
        <input type="hidden" name="eAccion" id="eAccion">
                            <div class="col-lg-12">
								<h2 class="title-1 m-b-25"><?=$_GET['eCodCliente'] ? 'Actualizar ' : '+ '?>Evento</h2>
                                <div class="card col-lg-12">
                                    
                                    <div class="card-body card-block">
                                        <!--campos-->
                                        
           <div class="form-group">
              <label>Cliente</label>
              <select class="form-control" id="eCodCliente" name="eCodCliente">
             <option value="">Seleccione...</option>
                                                        <?
     while($rPaquete = mysql_fetch_array($rsClientes))
{
         ?>
                  <option value="<?=$rPaquete{'eCodCliente'}?>" <?=($rPublicacion{'eCodCliente'}==$rPaquete{'eCodCliente'}) ? 'selected="selected"' : ''?>><?=$rPaquete{'tNombres'}.' '.$rPaquete{'tApellidos'}.' ('.$rPaquete{'tCorreo'}.')'?></option>
                  <?
}
    ?>
       </select>
              
               
           </div>
           <div class="form-group">
              <label>Fecha del Evento</label>
              <input type="text" class="form-control" name="fhFechaEvento" id="fhFechaEvento" placeholder="dd-mm-YYYY" value="<?=$rPublicacion{'fhFechaEvento'} ? date('d-m-Y',strtotime($rPublicacion{'fhFechaEvento'})) : ""?>" >
           </div>
           <div class="form-group">
              <label>Hora de Montaje</label>
              <input type="text" class="form-control" name="tmHoraEvento" id="tmHoraEvento" placeholder="HH:mm" value="<?=date('H:i',strtotime($rPublicacion{'fhFechaEvento'}))?>" >
           </div>
           <div class="form-group">
              <label>Direcci&oacute;n</label>
              <textarea class="form-control" rows="5" style="resize:none;" name="tDireccion" id="tDireccion" maxlength="250"><?=base64_decode(utf8_decode($rPublicacion{'tDireccion'}))?></textarea>
           </div>
           <div class="form-group">
              <label>Observaciones</label>
              <textarea class="form-control" rows="5" style="resize:none;" name="tObservaciones" id="tObservaciones" maxlength="250"><?=base64_decode(utf8_decode($rPublicacion{'tObservaciones'}))?></textarea>
           </div>
           
                                        <!--campos-->
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                
                                    <div class="card-body card-block">
                                    <table class="table table-borderless " id="table">
                                        <thead>
                                            <tr>
                                                <td></td>
                                                <td>
                                                    <input type="hidden" id="eCodServicio">
                                                    <input type="hidden" id="dPrecioVenta">
                                                    <select class="col-md-6 form-control" id="paquete" onchange="segmentar()">
                                                    <option value="">Paquete...</option>
                                                        <?
                                                        $select = "SELECT * FROM CatServicios";
                                                        $rsPaquetes = mysql_query($select);
                                                        while($rPaquete = mysql_fetch_array($rsPaquetes))
                                                        {
                                                            ?>
                                                        <option value="<?=$rPaquete{'eCodServicio'}.'-'.$rPaquete{'dPrecioVenta'}?>"><?=$rPaquete{'tNombre'}?></option>
                                                        <?
                                                        }
                                                                                            ?>
                                                    </select>
                                                </td>
                                                <td>
                                                    <input type="text" class="col-md-4 form-control" id="eCantidad" placeholder="Cantidad" value="<?=$rPublicacion{'eCantidad'}?>">
                                                </td>
												<td>
                                                    <input type="button" class="btn btn-info" value="Agregar" onclick="nvaFila()">
                                                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#inventario">+ Extras</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th></th>
												<th>Paquete</th>
                                                <th>Cantidad</th>
                                                <th>Precio</th>
                                            </tr>
                                        </thead>
                                        <tbody>
											<?
											$select = "	SELECT DISTINCT
															cs.tNombre,
                                                            cs.dPrecioVenta,
                                                            rep.eCodServicio,
                                                            rep.eCantidad
                                                        FROM CatServicios cs
                                                        INNER JOIN RelEventosPaquetes rep ON rep.eCodServicio = cs.eCodServicio
                                                        WHERE rep.eCodEvento = ".$_GET['eCodEvento'];
											$rsPublicaciones = mysql_query($select);
                                            $i = 0;
											while($rPublicacion = mysql_fetch_array($rsPublicaciones))
											{
												?>
											<tr id="paq<?=$i?>">
                                                <td><i class="far fa-trash-alt" onclick="deleteRow(<?=$i?>)"></i></td>
                                                <td>
                                                    <input type="hidden" name="eCodServicio<?=$i?>" id="eCodServicio<?=$i?>" value="<?=$rPublicacion{'eCodServicio'}?>">
                                                    <input type="hidden" name="eCantidad<?=$i?>" id="eCantidad<?=$i?>" value="<?=$rPublicacion{'eCantidad'}?>">
                                                    <?=$rPublicacion{'tNombre'}?>
                                                </td>
                                                <td>
                                                    <?=$rPublicacion{'eCantidad'}?>
                                                </td>
												<td>$<?=number_format($rPublicacion{'dPrecioVenta'}*$rPublicacion{'eCantidad'},2)?></td>
                                            </tr>
											<?
											$i++;
											}
											?>
                                        </tbody>
                                    </table>
      
                                    </div>
                                </div>
                                
                                <div class="col-lg-12">
                                
                                    <div class="card-body card-block">
                                    <table class="table table-borderless ">
                                        <thead>
                                            <tr>
                                                
                                                <td align="right" width="85%">
                                                    
                                                    <input type="hidden" id="totEvento" value="0">
                                                </td>
                                                <td id="totalVenta" align="right">
                                                    
                                                </td>
                                            </tr>
                                            
                                        </thead>
                                    </table>
      
                                    </div>
                                </div>
                                
                            </div>
    </form>
    </div>
                        </div>

<!--Modal de inventario-->
  <div class="modal fade" id="inventario" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          <!--inventario-->
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
        <div class="card">
        <div class="custom-tab">

											<nav>
												<div class="nav nav-tabs" id="nav-tab" role="tablist">
                                                    <?
                                                    for($i=0;$i<sizeof($tipos);$i++)
                                                    {
                                                        ?>
                                                    <a class="nav-item nav-link <?=($i==0) ? 'active' : ''?>" id="custom-nav-home-tab" data-toggle="tab" href="#custom-nav-<?=$tipos[$i]['eCodTipoInventario']?>" role="tab" aria-controls="custom-nav-<?=$tipos[$i]['eCodTipoInventario']?>"
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
                                                    <div class="tab-pane fade <?=($i==0) ? 'show active' : ''?>" id="custom-nav-<?=$tipos[$i]['eCodTipoInventario']?>" role="tabpanel" aria-labelledby="custom-nav-home-tab">
													
                                                        <!--tablas-->
                                                        <div class="table-data__tool">
                                    <div class="table-data__tool-left">   </div>
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
			   <th width="95%">Inventario</th>
				   <th>Piezas</th>
				   <th></th>
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
														" WHERE ci.eCodTipoInventario = ".$tipos[$i]['eCodTipoInventario'].
														" ORDER BY ci.tNombre ASC";
											$rsPublicaciones = mysql_query($select);
		   									
											while($rPublicacion = mysql_fetch_array($rsPublicaciones))
											{
												$select = "SELECT * FROM RelServiciosInventario WHERE eCodInventario = ".$rPublicacion{'eCodInventario'}." AND eCodServicio = ".$_GET['eCodServicio'];
												$rServicio = mysql_fetch_array(mysql_query($select));
												?>
											<tr>
												<td>
												<?=utf8_decode($rPublicacion{'tipo'})?> | <?=utf8_decode($rPublicacion{'tNombre'})?> | <?=utf8_decode($rPublicacion{'tMarca'})?>
												</td>
												<td>
													<input type="text" size="4" name="ePiezas<?=$b?>" id="ePiezas<?=$b?>" class="form-control" placeholder="10" value="<?=$rServicio{'ePiezas'}?>">
												</td>
                                                <td>
                                                    <input type="hidden" id="eCodServicio<?=$b?>" name="eCodServicio<?=$b?>" value="<?=$rServicio{'eCodInventario'}?>">
                                                    <input type="hidden" id="tPaquete<?=$b?>" name="tPaquete<?=$b?>" value="<?=$rServicio{'tNombre'}?>">
                                                    <input type="hidden" id="dPrecioVenta<?=$b?>" name="dPrecioVenta<?=$b?>" value="<?=$rServicio{'dPrecioVenta'}?>">
                                                    <input type="button" class="btn btn-info" onclick="nvaFila(<?=$b?>)" value="Agregar">
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
        </div>
        <!--tabs-->
          <!--inventario-->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        </div>
      </div>
      
    </div>
  </div>
<!--Modal de inventario-->

<script>
var options = {
			                         url: "auc/auc-clientes.php",
			                         getValue: "nombre",
			                         list: {
                                           onSelectItemEvent: function() {
                                           var selectedItemCode = $("#tCliente").getSelectedItemData().codigo;
                                           $("#eCodCliente").val(selectedItemCode).trigger("change");
                                           }
                                       }
		                           };
		          $("#tCliente").easyAutocomplete(options);	

    
    function segmentar()
    {
        var valor = document.getElementById('paquete').value;
        
        var datos = valor.split('-');
        document.getElementById('eCodServicio').value = datos[0];
        document.getElementById('dPrecioVenta').value = datos[1];
    }
    	
    
    //tabla
    function nvaFila(indice) {
		var codigo		=	!indice ? document.getElementById('eCodServicio')   :   document.getElementById('eCodServicio'+indice);
    	var cantidad	=	!indice ? document.getElementById('eCantidad')      :   document.getElementById('eCantidad'+indice);
        var paquete     =   !indice ? document.getElementById('paquete')        :   document.getElementById('paquete'+indice);
        var dPrecio     =   !indice ? document.getElementById('dPrecioVenta')   :   document.getElementById('dPrecioVenta'+indice);
        var tPaquete    =   !indice ? $( "#paquete option:selected" ).text()    :   document.getElementById('tPaquete'+indice);
        
        if(codigo.value!="" && cantidad.value!="")
        {
            var total = dPrecio.value*cantidad.value;
            
		var x = document.getElementById("table").rows.length;
    var table = document.getElementById("table");
    var row = table.insertRow(x);
    row.id="paq"+(x);
    row.innerHTML = '<td><i class="far fa-trash-alt" onclick="deleteRow('+(x-2)+')"></i><input type="hidden" name="eCodTipo'+(x-2)+'" id="eCodTipo'+(x-2)+'" value="'+(indice ? 1 : 2)+'"></td>';
    row.innerHTML += '<td><input type="hidden" name="eCodServicio'+(x-2)+'" id="eCodServicio'+(x-2)+'" value="'+codigo.value+'">'+tPaquete+'</td>';
    row.innerHTML += '<td><input type="hidden" name="eCantidad'+(x-2)+'" id="eCantidad'+(x-2)+'" value="'+cantidad.value+'">'+cantidad.value+'</td>';
	row.innerHTML += '<td id="dTotal'+(x-2)+'"><input type="hidden" id="totalServ'+(x-2)+'" value="'+total.toFixed(2)+'">$'+total.toFixed(2)+'</td>';
   
    calcular();
            
    }
}
    
    function deleteRow(rowid)  {   
    var row = document.getElementById('paq'+rowid);
    row.parentNode.removeChild(row);
        
        calcular();
}

    function calcular()
    {
        var venta = 0;
        var cmbTotal = document.querySelectorAll("[id^=totalServ]");
        cmbTotal.forEach(function(nodo){
            
            venta = parseInt(venta) + parseInt(nodo.value);
            
        });
        
        document.getElementById('totalVenta').innerHTML = "Total: $"+venta.toFixed(2);
    }
    
    calcular();

		</script>