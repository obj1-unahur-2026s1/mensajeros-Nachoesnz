// Nuevo paquete para requerimiento 9
object paqueteExpress {
  var estaPago = true
  method verEstadoPago() { return estaPago }
  method cancelarPago() { estaPago = false }
  method validarPago() { estaPago = true }
  method puedeSerEntregado(mensajero) { return estaPago && mensajero.puedeLlevar(self) }
  method precio() { return 75 }
}
import destinos.*
import mensajeros.*

object paquete{
  
  var estaPago = true
  
  method verEstadoPago(){
    return estaPago
  }

  method cancelarPago(){
    estaPago = false
  }
  method validarPago(){
    estaPago = true
  }
}

object paquetito{
  const estaPago = true
  method verEstadoPago(){
    return estaPago
  }
  method cancelarPago(){}
  method validarPago(){}
  method puedeSerEntregado(mensajero) {
    return true // cualquier mensajero puede llevarlo
  }
  method precio() {
    return 0 // es gratis
  }
}

object paquetonViajero {
  var destinos = []
  var montoPagado = 0
  const precioPorDestino = 100

  method agregarDestino(destino) {
    destinos.add(destino)
  }

  method precio() {
    return destinos.size() * precioPorDestino
  }

  method pagar(monto) {
    montoPagado = montoPagado + monto
  }

  method verEstadoPago() {
    return montoPagado >= self.precio()
  }

  method cancelarPago() {
    montoPagado = 0
  }

  method validarPago() {
    montoPagado = self.precio()
  }

  method puedeSerEntregado(mensajero) {
    // El mensajero debe poder pasar por todos los destinos y el paquete debe estar totalmente pago
    return self.verEstadoPago() && destinos.all(destino => destino.puedePasar(mensajero))
  }
}

// Ajuste: el paquete original tiene precio 50
paquete.precio = method() {
  return 50
}