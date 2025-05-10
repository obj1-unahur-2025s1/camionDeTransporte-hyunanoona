object camion {
    const carga = []
    
    const peso = 1000
    
    method subirAlCamion(paquete) = carga.add(paquete)
    
    method bajarDelCamion(paquete) = carga.remove(paquete)
    
    method peso() = peso + carga.sum{p => p.peso()}
    
    method losPesosSonPares() = carga.all{p => p.peso().even()}
    
    method buscarUnPeso(unPeso) = carga.any{p => p.peso() == unPeso}
    
    method buscarPeligrosidad(unValor) = carga.any{p => p.peligrosidad() == unValor}
    
    method buscarElementosPeligrosos(unValor) = carga.filter{p => p.peligrosidad() > unValor}
    
    method listaDeObjetosPeligrosos(unaCosa, unValor) = carga.filter{p => p == unaCosa}.forEach{p => p.peligrosidad() > unValor}

    method excedidoDePeso() = self.peso() > 2500

    method puedeCircularEnRuta(unValor) = not self.excedidoDePeso() and carga.peligrosidad() < unValor

    //Se pide además, que se le pueda consultar al camión si tiene alguna cosa que pesa entre un valor mínimo y un valor máximo, y la 
    //cosa más pesada que tiene cargada.
    method algunaCosaEntre(unPeso, otroPeso) = carga.any{c => c.peso().between(unPeso, otroPeso)}

    method cosaMasPesada() = carga.max{c => c.peso()}
}