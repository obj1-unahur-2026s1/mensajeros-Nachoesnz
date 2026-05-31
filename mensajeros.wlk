// Nuevo mensajero para requerimiento 9
object speedy {
  var pesoActual = 70
  method peso() { return pesoActual }
  method cambiarPeso(nuevoPeso) { pesoActual = nuevoPeso }
  method puedeLlevar(paquete) { return true } // puede llevar cualquier paquete
}
import destinos.*
import paquetes.*

object roberto{

  var vehiculo = bicicleta
  var pesoPersona = 50

  method cambiarPeso(pesoNuevo){
    pesoPersona = pesoNuevo
  }

  method usarBicicleta(){
    vehiculo = bicicleta
  }
  method usarCamion(){
    vehiculo = camion
  }
  
  method peso(){
      return pesoPersona + vehiculo.pesoTotal()
    }

  method credito(){}
}

object chuckNorris {
  method peso(){
    return 80
  }
  method puedeLlamar(){
    return true
  }

  method credito(){}
}

object neo {
  var credito = true

  method puedeLlamar(){
    return self.verEstadoCredito()
    
  }
  method peso(){
    return 0
  }
  method cargarleCredito(){
    credito = true
  }
  method SacarleCredito(){
    credito = false
  }

  method verEstadoCredito(){
    return credito
  }
}


object bicicleta{
  method pesoTotal(){
    return 5
  }
}

object camion {
  const pesoSinAcoplado = 200
  const pesoUnAcoplado = 500
  var cantidadAcoplados = 0
  
  method pesoTotalAcoplados(){
    return pesoUnAcoplado * cantidadAcoplados
  }

  method cambiarCantidadAcoplados(cantidad){
    cantidadAcoplados = cantidad
  }

  method pesoTotal(){
    return pesoSinAcoplado + self.pesoTotalAcoplados()
  }
}