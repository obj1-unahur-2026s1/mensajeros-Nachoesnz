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