import destinos.*
import mensajeros.*
import paquetes.*

object empresaMensajeria{

    var mensajeros = [roberto,neo,chuckNorris]
    var paquetesEnviados = []
    var paquetesPendientes = []

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
        return unPaquete.puedeSerEntregado(self.primerEmpleado())
    }

    method primerEmpleado(){
        return mensajeros.first()
    }

    method ultimoEmpleado(){
        return mensajeros.last()
    }

    method pesoUltimoMensajero(){
        return self.ultimoEmpleado().peso()
    }

    // 1. Averiguar si un paquete puede ser entregado por la empresa
    method puedeEntregarPaquete(paquete) {
        return mensajeros.any(m => paquete.puedeSerEntregado(m))
    }

    // 2. Obtener todos los mensajeros que pueden llevar un paquete dado
    method mensajerosQuePueden(paquete) {
        return mensajeros.filter(m => paquete.puedeSerEntregado(m))
    }

    // 3. Saber si la empresa tiene sobrepeso
    method tieneSobrepeso() {
        if (mensajeros.isEmpty()) return false
        return mensajeros.map(m => m.peso()).average() > 500
    }

    // 4. Enviar un paquete
    method enviarPaquete(paquete) {
        var posibles = self.mensajerosQuePueden(paquete)
        if (posibles.isEmpty()) {
            paquetesPendientes.add(paquete)
            return false
        } else {
            paquetesEnviados.add(paquete)
            return true
        }
    }

    // 5. Facturación
    method facturacion() {
        return paquetesEnviados.map(p => p.precio()).sum()
    }

    // 6. Enviar un conjunto de paquetes
    method enviarPaquetes(paquetes) {
        paquetes.forEach(p => self.enviarPaquete(p))
    }

    // 7. Encontrar el paquete pendiente más caro y enviarlo
    method enviarPendienteMasCaro() {
        if (paquetesPendientes.isEmpty()) return false
        var masCaro = paquetesPendientes.maxBy(p => p.precio())
        if (self.enviarPaquete(masCaro)) {
            paquetesPendientes.remove(masCaro)
            return true
        }
        return false
    }

    // Métodos auxiliares para tests
    method verPaquetesEnviados() {
        return paquetesEnviados
    }
    method verPaquetesPendientes() {
        return paquetesPendientes
    }
    method limpiarPaquetes() {
        paquetesEnviados.clear()
        paquetesPendientes.clear()
    }
}