import destinos.*
import mensajeros.*
import paquetes.*

object empresaMensajeria{

    var mensajeros = [roberto,neo,chuckNorris]

    method verMensajeros(){
        return mensajeros
    }

    method agregarMensajero(persona){
        mensajeros.add(persona)
    }

    method sacarMensajero(persona){
        mensajeros.remove(persona)
    }

    method despedirATodos(){
        mensajeros.clear()
    }

    method esEmpresaGrande(){
        return mensajeros.size() > 2
    }

    method puedeSerEntregadoPorElPrimerMensajero(unPaquete) { // 5
        return unPaquete.puedeSerEntregado(self.primerEmpleado()) // el que sabe si puede ser entregado es el paquete, por dominio del ejercicio al paquete se le pasa un mensajero en este caso tiene que ser el primero de la lista
    }

    method primerEmpleado(){
        return mensajeros.first() // complemento del 5, para usar self
    }

    method ultimoEmpleado(){
        return mensajeros.last() // indica el ultimo mensajero.
    }

    method pesoUltimoMensajero(){
        return self.ultimoEmpleado().peso()
    }

}