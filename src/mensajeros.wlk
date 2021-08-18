object paqueteOriginal {
	const property precio = 50
	const property destino = puenteBrooklyn
	var property estaPago = true
	
	method puedeSerEnviadoPor(mensajero) {
		return (estaPago && destino.puedePasar(mensajero) )
	}
	
}
object paquetito {
	const property precio = 0
	const property destino = laMatrix
	const property estaPago = true
	
	method puedeSerEnviadoPor(mensajero) {
		return (estaPago && destino.puedePasar(mensajero) )
	}
	
}

object paquetonViajero {
	const property destino = [puenteBrooklyn,laMatrix]
	var property montoPagado = 0
	
	method precio() = destino.size()*100
	
	method realizarPago(cantidad) {
		if ((self.precio() - montoPagado - cantidad ) < 0) {
			throw new DomainException(message="Se esta pagando demas")
		}
		else {
		montoPagado += cantidad
		}
	}
	method estaPago() = montoPagado >= self.precio()
	
	method puedeSerEnviadoPor(mensajero) {
		return (self.estaPago() && destino.all({unDestino => unDestino.puedePasar(mensajero)}))
	}
}
object puenteBrooklyn {
	
	method puedePasar(mensajero) = mensajero.peso() <= 1000
	
}

object laMatrix {
	
	method puedePasar(mensajero) = mensajero.puedeLlamar()

}

object roberto {
	
	const peso = 100
	var vehiculo = camion
	
	//No me gusta el nombre "cual"//
	method vehiculo(cual) {
		vehiculo = cual
	}
	method peso() = peso + vehiculo.pesoTotal()
	method puedeLlamar() = false
	
	method puedeEntregar(paquete){
		return paquete.puedeSerEnviadoPor(self)
	}
}
object chuckNorris {
	const property peso = 900
	
	method puedeLlamar() = true
	
	method puedeEntregar(paquete){
		return paquete.puedeSerEnviadoPor(self)
	}
}
object neo {
	
	const property peso = 0
	var credito = true
	
	method credito(cantidad) {
		credito = cantidad
	}
	
	method puedeLlamar() = credito
	
	method puedeEntregar(paquete){
		return paquete.puedeSerEnviadoPor(self)
	}
}
object bicicleta {
	
	const property peso = 1
	
}

object camion {
	var peso = 100
	var cantidadAcoplados = 3
	
	method peso(cantidad) {
		peso = cantidad
	}
	method cantidadAcoplados(cantidad) {
		cantidadAcoplados = cantidad
	}
	method pesoTotal() = peso + 500*cantidadAcoplados
}

/* Parte 2 */

object empresaMensajeria {
	
	const property listaMensajeros = []
	const property paquetesPendientes = []
	
	method contratarMensajero(mensajero) {
		listaMensajeros.add(mensajero)
	}
	method despedirMensajero(mensajero) {
		listaMensajeros.remove(mensajero)
	}
	method despedirAtodos(){
		listaMensajeros.clear()
	}
	method mensajeriaGrande(){
		return listaMensajeros.size() > 2 
	}
	method primerMensajeroPuedeEntregar(paquete) {
		return listaMensajeros.first().puedeEntregar(paquete)
	}
	method pesoUltimoMensajero() = listaMensajeros.last().peso()
	
	method puedenEntregar(paquete) {
		return listaMensajeros.filter({mensajero => mensajero.puedeEntregar(paquete)})
	}
	/* Decidi usar puedenEntregar, aunque se que con un listaMensajeros.any(condicion) tambien se puede realizar */
	method esPosibleEntregar(paquete) {
		return self.puedenEntregar(paquete).size() >= 1
	}
	method tieneSobrepeso() {
		return (listaMensajeros.sum({mensajero => mensajero.peso()}) / listaMensajeros.size()) > 500
	}
	method paquetePendienteMasCaro() {
		var paqueteMasCaro
		paqueteMasCaro = paquetesPendientes.max({paquete => paquete.precio()})
		paquetesPendientes.remove(paqueteMasCaro)
		self.enviar(paqueteMasCaro)
	}
	method enviar(paquete) {
		if (not(self.esPosibleEntregar(paquete))){
			paquetesPendientes.add(paquete)
		}
	}
	method enviarTodos(paquetes) {
		paquetes.forEach({unPaquete => self.enviar(unPaquete)})
	}
}
/* Nuevo Mensajero */

object hermes {
	/*Hermes vuela */
	const property peso = 0
	const credito = true

	method puedeLlamar() = credito
	
	method puedeEntregar(paquete){
		return paquete.puedeSerEnviadoPor(self)
	}
}

object paqueteMisterioso {
	
	const property destino = [puenteBrooklyn, puenteBrooklyn,puenteBrooklyn, laMatrix]
	const property estaPago = true
	
	method precio() = destino.size() * 4000
		
	method puedeSerEnviadoPor(mensajero) {
		return ( estaPago && destino.all({unDestino => unDestino.puedePasar(mensajero)}))
	}
}