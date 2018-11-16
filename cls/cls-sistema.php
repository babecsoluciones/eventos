<?php
require_once("swgc-mysql.php");
session_start();


class clSis
{
	public function __construct()
	{
		
	}
	public function iniciarSesion()
	{
		$tCorreo = "'".$_POST['tCorreo']."'";
		$tPasswordAcceso = "'".base64_encode($_POST['tPasswordAcceso'])."'";
		
		$select = "SELECT * FROM SisUsuarios WHERE tCorreo = $tCorreo AND tPasswordAcceso = $tPasswordAcceso";
		$rsUsuario = mysql_query($select);
		$rUsuario = mysql_fetch_array($rsUsuario);
		
		if($rsUsuario)
		{
			$_SESSION['sessionAdmin'] = array($rUsuario);
			return array('exito'=>1);
		}
		else
		{
			return array('exito'=>0);
		}
	}
	
	public function cargarSeccion($seccion)
	{
		//$res->validarSeccion($seccion);
		//$res = $this->validarSeccion($seccion);
			$fichero = './'.$seccion.'.php';
			return include($fichero);

	}
	
	public function generarMenu()
	{
		$tMenu = '';
		$select = "	SELECT DISTINCT
						ss.tCodSeccion,
						ss.tTitulo,
						ss.tIcono
					FROM SisSecciones ss".
					($_SESSION['sessionAdmin'][0]['bAll'] ? "" : "INNER JOIN SisSeccionesPerfiles ssp ON ssp.tCodSeccion = ss.tCodSeccion").
					" WHERE
					ss.eCodEstatus = 3
					AND
					ss.tCodPadre = 'inicio' ".
					($_SESSION['sessionAdmin'][0]['bAll'] ? "" :
					" AND
					ssp.eCodPerfil = ".$_SESSION['sessionAdmin'][0]['eCodPerfil']).
					" ORDER BY ePosicion ASC";

		$rsMenus = mysql_query($select);;
		while($rMenu = mysql_fetch_array($rsMenus))
		{
			$activo = ($_GET['tCodSeccion']==$rMenu{'tCodSeccion'}) ? 'class="active"' : '';
			$bArchivo = file_exists($rMenu{'tCodSeccion'}.'.php') ? '?tCodSeccion='.$rMenu{'tCodSeccion'} : '#';
			$tMenu .= '<li '.$activo.'>
                            <a href="'.$bArchivo.'">
                                <i class="fa fa-folder"></i>'.utf8_decode($rMenu{'tTitulo'}).'</a>
                        </li>';
		}
		return $tMenu;
	}
	
	public function validarSeccion($seccion)
	{
		$select = 	"SELECT * FROM SisSeccionesPerfiles ".
					($_SESSION['sessionAdmin'][0]['bAll'] ? "" : " WHERE eCodPerfil = ".$_SESSION['sessionAdmin'][0]['eCodPerfil']." AND tCodSeccion = '".$seccion."'");
		
		$rsSeccion = mysql_query($select);
		$rSeccion = mysql_fetch_array($rsSeccion);
		return $rSeccion{'tCodSeccion'} ? true : false;
	}
	
	public function validarEnlace($seccion)
	{
		$select = 	"SELECT * FROM SisSeccionesPerfiles ".
					($_SESSION['sessionAdmin'][0]['bAll'] ? "" : " WHERE eCodPerfil = ".$_SESSION['sessionAdmin'][0]['eCodPerfil']." AND tCodSeccion = '".$seccion."'");
		
		$rsSeccion = mysql_query($select);
		if(mysql_num_rows($rsSeccion)<1)
		{
			return false;
		}
        else
        {
            return true;
        }
	}
	
	public function registrarUsuario()
    {
        $eCodUsuario = $_POST['eCodUsuario'] ? $_POST['eCodUsuario'] : false;
        $eCodPerfil = $_POST['eCodPerfil'] ? $_POST['eCodPerfil'] : false;
        $tNombre = $_POST['tNombre'] ? "'".utf8_encode($_POST['tNombre'])."'" : false;
        $tApellidos = $_POST['tApellidos'] ? "'".utf8_encode($_POST['tApellidos'])."'" : false;
        $tPasswordAcceso = $_POST['tPasswordAcceso'] ? "'".base64_encode($_POST['tPasswordAcceso'])."'" : false;
        $tPasswordOperaciones = $_POST['tPasswordOperaciones'] ? "'".base64_encode($_POST['tPasswordOperaciones'])."'" : false;
        $tCorreo = $_POST['tCorreo'] ? "'".$_POST['tCorreo']."'" : false;
        
        $fhFechaCreacion = "'".date('Y-m-d H:i:s')."'";
        
        if(!$eCodUsuario)
        {
            $insert = "INSERT INTO SisUsuarios (tNombre, tApellidos, tCorreo, tPasswordAcceso, tPasswordOperaciones,  eCodEstatus, eCodPerfil, fhFechaCreacion) VALUES ($tNombre, $tApellidos, $tCorreo, $tPasswordAcceso, $tPasswordOperaciones, 3, $eCodPerfil, $fhFechaCreacion)";
        }
        else
        {
            $insert = "UPDATE SisUsuarios SET
            tPasswordAcceso = $tPasswordAcceso,
            tPasswordOperaciones = $tPasswordOperaciones,
            eCodPerfil = $eCodPerfil
            WHERE
            eCodUsuario = $eCodUsuario";
        }
        
        $rsUsuario = mysql_query($insert);
        
        return $rsUsuario ? true : false;
    }
    
    public function actualizarPerfil()
    {
        $eCodUsuario = $_POST['eCodUsuario'] ? $_POST['eCodUsuario'] : false;
        $tPasswordAcceso = $_POST['tPasswordAcceso'] ? "'".base64_encode($_POST['tPasswordAcceso'])."'" : false;
        $tPasswordOperaciones = $_POST['tPasswordOperaciones'] ? "'".base64_encode($_POST['tPasswordOperaciones'])."'" : false;
        $tCorreo = $_POST['tCorreo'] ? "'".$_POST['tCorreo']."'" : false;
        
        $fhFechaCreacion = "'".date('Y-m-d H:i:s')."'";
        
            $insert = "UPDATE SisUsuarios SET
            tPasswordAcceso = $tPasswordAcceso,
            tPasswordOperaciones = $tPasswordOperaciones
            WHERE
            eCodUsuario = $eCodUsuario";
        
        
        $rsUsuario = mysql_query($insert);
        
        $this->cerrarSesion();
        
        return $rsUsuario ? true : false;
    }
	
	public function cerrarSesion()
	{
		$_SESSION = array();
		$_SESSION['sessionAdmin'] = NULL;
		session_destroy();
	}
	
	//Secciones
	public function validarPermiso($seccion)
	{
		$bAll = $_SESSION['sessionAdmin'][0]['bAll'];
		$select = 	"SELECT * FROM SisSeccionesPerfiles ".
					($bAll ? "" : " WHERE eCodPerfil = ".$_SESSION['sessionAdmin'][0]['eCodPerfil']." AND tCodSeccion = '".$seccion."'");
		
		$rsSeccion = mysql_query($select);
		$rSeccion = mysql_fetch_array($rsSeccion);
		if($rSeccion{'bAll'} || $bAll)
		{
			return true;
		}
        else
        {
            return false;
        }
	}
	
	//Clientes
	public function registrarCliente()
    {   
        /*Preparacion de variables*/
        
        $eCodCliente = $_POST['eCodCliente'] ? $_POST['eCodCliente'] : false;
        $tNombre = "'".$_POST['tNombre']."'";
        $tApellidos = "'".$_POST['tApellidos']."'";
        $tCorreo = "'".$_POST['tCorreo']."'";
        $tTelefonoFijo = "'".$_POST['tTelefonoFijo']."'";
        $tTelefonoMovil = "'".$_POST['tTelefonoMovil']."'";
		$eCodUsuario = $_SESSION['sessionAdmin'][0]['eCodUsuario'];
		$fhFechaCreacion = "'".date('Y-m-d H:i')."'";
        
        if(!$eCodCliente)
        {
            $insert = " INSERT INTO CatClientes
            (
            tNombres,
            tApellidos,
            tCorreo,
            tTelefonoFijo,
            tTelefonoMovil,
            eCodUsuario,
            fhFechaCreacion,
			eCodEstatus
			)
            VALUES
            (
            $tNombre,
            $tApellidos,
            $tCorreo,
            $tTelefonoFijo,
            $tTelefonoMovil,
            $eCodUsuario,
            $fhFechaCreacion,
			3
            )";
        }
        else
        {
            $insert = "UPDATE 
                            CatClientes
                        SET
                            tNombres= $tNombre,
                            tApellidos= $tApellidos,
                            tCorreo= $tCorreo,
                            tTelefonoFijo= $tTelefonoFijo,
                            tTelefonoMovil= $tTelefonoMovil,
                            WHERE
                            eCodCliente = ".$eCodCliente;
        }
        
        $rsPublicacion = mysql_query($insert);
        //return $insert;
		//echo $insert;
        return $rsPublicacion ? true : false;
    }
	
	//Servicios
	public function registrarServicio()
    {   
        /*Preparacion de variables*/
        
        $eCodServicio = $_POST['eCodServicio'] ? $_POST['eCodServicio'] : false;
        $tNombre = "'".utf8_encode($_POST['tNombre'])."'";
        $tDescripcion = "'".utf8_encode($_POST['tDescripcion'])."'";
        $dPrecio = $_POST['dPrecio'];
        
        if(!$eCodServicio)
        {
            $insert = " INSERT INTO CatServicios
            (
            tNombre,
            tDescripcion,
            dPrecioVenta
			)
            VALUES
            (
            $tNombre,
            $tDescripcion,
            $dPrecio
            )";
        }
        else
        {
            $insert = "UPDATE 
                            CatServicios
                        SET
                            tNombre= $tNombre,
                            tDescripcion= $tDescripcion,
                            dPrecioVenta= $dPrecio
                            WHERE
                            eCodServicio = ".$eCodServicio;
        }
        
        $rsPublicacion = mysql_query($insert);
		
		$eCodServicio = $eCodServicio ? $eCodServicio : mysql_insert_id();
		
		mysql_query("DELETE FROM RelServiciosInventario WHERE eCodServicio = $eCodServicio");
	foreach($_POST['eCodInventario'] as $key => $eCodInventario)
	{
		$ePiezas = $_POST['ePiezas'][$key];
		mysql_query("INSERT INTO relServiciosInventario (eCodServicio, eCodInventario, ePiezas) VALUES ($eCodServicio, $eCodInventario, $ePiezas)");
	}
		
        //return $insert;
		//echo $insert;
        return $rsPublicacion ? true : false;
    }
	
	//Inventario
	public function registrarInventario()
    {   
        /*Preparacion de variables*/
        
        $eCodInventario = $_POST['eCodInventario'] ? $_POST['eCodInventario'] : false;
		$eCodTipoInventario = $_POST['eCodTipoInventario'];
        $tNombre = "'".$_POST['tNombre']."'";
        $tMarca = "'".$_POST['tMarca']."'";
        $tDescripcion = "'".$_POST['tDescripcion']."'";
        $dPrecioInterno = $_POST['dPrecioInterno'];
        $dPrecioVenta = $_POST['dPrecioVenta'];
        $ePiezas = $_POST['ePiezas'];
        $tImagen = "'".base64_encode($_POST['tImagen'])."'";
        
        if(!$eCodInventario)
        {
            $insert = " INSERT INTO CatInventario
            (
			eCodTipoInventario,
            tNombre,
            tMarca,
            tDescripcion,
            dPrecioVenta,
			dPrecioInterno,
			tImagen,
			ePiezas
			)
            VALUES
            (
            $eCodTipoInventario,
            $tNombre,
            $tMarca,
            $tDescripcion,
            $dPrecioVenta,
			$dPrecioInterno,
			$tImagen,
			$ePiezas
            )";
        }
        else
        {
            $insert = "UPDATE 
                            CatInventario
                        SET
                            eCodTipoInventario=$eCodTipoInventario,
            				tNombre=$tNombre,
            				tMarca=$tMarca,
            				tDescripcion=$tDescripcion,
            				dPrecioVenta=$dPrecioVenta,
							dPrecioInterno=$dPrecioInterno,
							tImagen=$tImagen,
							ePiezas=$ePiezas
                            WHERE
                            eCodInventario = ".$eCodInventario;
        }
        
        $rsPublicacion = mysql_query($insert);
        //return $insert;
		//echo $insert;
        return $rsPublicacion ? true : false;
    }
}



?>