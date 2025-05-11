
object knightRider {
    method peso() = 500
    method peligrosidad() = 10
    method bulto() = 1
    method sufrirConsecuencias() {}
}

object bumblebee {
    var transformado = "auto"
    method transformar(unaForma) {
      transformado = unaForma
    }
    method peso() = 800
    method peligrosidad() {
      return
        if(transformado == "auto"){15}
        else{30}
    }
    method bulto() = 2
    method sufrirConsecuencias() {self.transformar("robot")}
}

object ladrillos {
    const pesoLadrillo = 2
    var cantidadDeLadrillos = 0
    method peso() = cantidadDeLadrillos*pesoLadrillo
    method añadirLadrillos(unNumero){
        cantidadDeLadrillos = cantidadDeLadrillos + unNumero
    }
    method peligrosidad() = 2
    method bulto(){
    return
        if(cantidadDeLadrillos<=100){1}
        else if(cantidadDeLadrillos.between(101, 300)){2}
        else{3}
    }
    method sufrirConsecuencias() {self.añadirLadrillos(12)}
}

object arena {
    var peso = 0
    method peso() = peso
    method agregar(unaCantidad) {
      peso = peso + unaCantidad
    }
    method quitar(unaCantidad){
        peso = (peso - unaCantidad).max(0)
    }
    method peligrosidad() = 1
    method bulto() = 1
    method sufrirConsecuencias() {self.quitar(10)}
}

object bateria {
    var property hayMisiles = false
    method peso() {
      return
        if(hayMisiles){100}
        else{200}
    }
    method peligrosidad() {
      return
        if(hayMisiles){100}
        else{0}
    }
    method bulto() {
      return
        if(hayMisiles){2}
        else{1}
    }
    method sufrirConsecuencias() {self.hayMisiles(true)}
}

object contenedor {
    const cosas = []
    const peso = 100
    method peso() = peso + cosas.sum{c => c.peso()}
    method agregar(unaCosa) = cosas.add(unaCosa)
    method quitar(unaCosa) = cosas.remove(unaCosa)
    method peligrosidad() {
      return
        if(cosas.isEmpty()){0}
        else{cosas.max{c => c.peligrosidad()}.peligrosidad()}
    }
    method bulto() = 1 + cosas.sum{c => c.bulto()}
    method sufrirConsecuencias() = cosas.forEach{c => c.sufrirConsecuencias()}
}

object residuos {
    var peso = 0
    method peso() = peso
    method agregarResiduos(unaCantidad) {
      peso = peso + unaCantidad
    }
    method peligrosidad() = 200
    method bulto() = 1
    method sufrirConsecuencias() {self.agregarResiduos(15)}
}

object embalaje {
    var cosa = null
    method envolver(unaCosa){
        cosa = unaCosa
    }
    method peso() = cosa.peso()
    method peligrosidad() = cosa.peligrosidad()*0.5
    method bulto() = 2
    method sufrirConsecuencias() {}
}