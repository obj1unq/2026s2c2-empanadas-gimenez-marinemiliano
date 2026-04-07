
object galvan {

	//saldo  hacerlo con saldo
	var sueldo = 15000
	var flagDeuda = 0
	var totalDeuda = 0 
	var totalDinero = 0

    //primera parte
	method sueldo() {return sueldo}

	//orden
	method sueldo(_sueldo) {sueldo = _sueldo}

	//segunda parte

	//getter
	method totalCobrado() {return  self.sueldo()}

	//getter
	//method cobrarSueldo() {return self.sueldo()}


	//parte dos
	//manejo fijo de las finanzas de galvan

	//setter orden
	method gastar(_dinero) 
	
	{

		self.acumuladorDeDeuda(_dinero)
		self.actualizarDeuda(self.totalDeuda(),self.totalDinero())

		if ( self.totalDeuda() > 0) {
		  
		  	totalDinero = 0
		  	self.actualizarSaldo(self.totalDinero(),self.totalDeuda())
			
		}
		else
		{

			self.actualizarSaldo(self.totalDinero(),self.totalDeuda())
		}

		
	}

	//orden setter
	method acumuladorDeDeuda(_dinero) {
	  
	  totalDeuda += _dinero
	}



	//getter consulta
	method totalDeuda() {return totalDeuda}

	method totalDinero() {return totalDinero}


	method cobrarSueldo() {
	  
	  //necesito guardarme el valor de la deuda porque despues
	  //en la siguiente linea se pisa con "deuda actualizada"
	  //o sea se borra el valor que aca lo estoy asignando

	   flagDeuda = self.totalDeuda()

	   self.cargarSueldo(self.sueldo())
	  
	   self.actualizarDeuda(self.totalDeuda(),self.sueldo())

	   self.actualizarSaldo(self.totalDinero(),flagDeuda)

	   //flagDeuda = 0
	}
	
	method actualizarDeuda(_deuda,_dinero) {
	  
	  totalDeuda = (_deuda - _dinero).max(0)
	}

	method cargarSueldo(_dinero)
	{
		totalDinero += _dinero
	}

	method actualizarSaldo(_dinero,_deuda) {
	  
	  totalDinero = (_dinero - _deuda).max(0)
	}

}

object baigorria {
	
	var cantEmpanadasVendidas = 0
	var comisionPorEmpanada = 15
	var sueldoAcumulado = 0
	

	//primera parte

	method comisionPorEmpanada() {return comisionPorEmpanada}

	//getter
	method montoEmpanada() {return self.comisionPorEmpanada()}

	//getter	
	method sueldo() {return  self.empanadasVendidas() * self.montoEmpanada()}

	//setter
	method actualizarEmpanadasVendidas(_cantEmpanadas) {
		cantEmpanadasVendidas += _cantEmpanadas
	}

	//getter
	method empanadasVendidas() {return cantEmpanadasVendidas}

	//setter orden
	method actualizarEmpanadasVendidas() {cantEmpanadasVendidas = 0}


	//segundo parte

	//getter
	method totalCobrado() {return sueldoAcumulado}

	//setter modifica el orden
	method cobrarSueldo() {
		
		sueldoAcumulado += self.sueldo() 
		self.actualizarEmpanadasVendidas()
	}
}

object gimenez {

	var fondo = 300000

	//primera parte

	//getter
	method fondo() {return fondo}

	//setter
	//method pagarA(_empleado) {
	
		//fondo = self.fondo() - _empleado.sueldo()
	//}


	//segunda parte

	//orden altera el estado del objeto
	method pagarA(_empleado) {

    	fondo = fondo - _empleado.sueldo()
    	_empleado.cobrarSueldo()
	}

}






