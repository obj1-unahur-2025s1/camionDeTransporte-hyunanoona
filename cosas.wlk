object knightRider {
    method peso() = 500
    method peligrosidad() = 10
}

object bumblebee {
    var transformado = "auto"
    method transformar(unaForma) {
      transformado = unaForma
    }
    method peso() = 800
    method peligrosidad() {
      return
        if(transformado == "auto"){
            15
        }
        else{
            30
        }
    }
}

object ladrillos {
    const pesoLadrillo = 2
    var cantidadDeLadrillos = 0
    method peso() = cantidadDeLadrillos*pesoLadrillo
    method añadirLadrillos(unNumero){
        cantidadDeLadrillos = cantidadDeLadrillos + unNumero
    }
    method peligrosidad() = 2
}

object arena {
    var peso = null
    method peso() = peso
    method agregarArena(unaCantidad) {
      peso = peso + unaCantidad
    }
    method peligrosidad() = 1
}

object bateria {
    method peso() {
      return
        if(self.hayMisiles()){
            300
        }
        else{
            200
        }
    }
    method hayMisiles() = true
    method peligrosidad() {
      return
        if(self.hayMisiles()){
            100
        }
        else{
            0
        }
    }
}

object contenedor {
    const cosas = []
    const peso = 100
    method peso() = peso + cosas.sum{c => c.peso()}
    method agregar(unaCosa) = cosas.add(unaCosa)
    method quitar(unaCosa) = cosas.remove(unaCosa)
    method peligrosidad() {
      return
        if(cosas.isEmpty()){
            0
        }
        else{
            cosas.max{c => c.peligrosidad()}.peligrosidad()
        }
    }
}

object residuos {
    var peso = null
    method peso() = peso
    method agregarResiduos(unaCantidad) {
      peso = peso + unaCantidad
    }
    method peligrosidad() = 200
}

object embalaje {
    var cosa = null
    method envolver(unaCosa){
        cosa = unaCosa
    }
    method peso() = cosa.peso()
    method peligrosidad() = cosa.peligrosidad()*0.5
}