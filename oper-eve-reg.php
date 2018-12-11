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
              <input type="text" class="form-control" name="fhFechaEvento" id="fhFechaEvento" placeholder="dd/mm/YYYY" value="<?=date('d/m/Y',strtotime($rPublicacion{'fhFechaEvento'}))?>" >
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
												<td><input type="button" class="btn btn-info" value="Agregar" onclick="nvaFila()"></td>
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
    function nvaFila() {
		var codigo		=	document.getElementById('eCodServicio'),
    		cantidad	=	document.getElementById('eCantidad'),
            paquete     =   document.getElementById('paquete'),
            dPrecio     =   document.getElementById('dPrecioVenta');
        
        if(codigo.value!="" && cantidad.value!="")
        {
            var total = dPrecio.value*cantidad.value;
            
            var tPaquete = $( "#paquete option:selected" ).text();
            
		var x = document.getElementById("table").rows.length;
    var table = document.getElementById("table");
    var row = table.insertRow(x);
    row.id="paq"+(x);
    row.innerHTML = '<td><i class="far fa-trash-alt" onclick="deleteRow('+(x-2)+')"></i></td>';
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

		</script>