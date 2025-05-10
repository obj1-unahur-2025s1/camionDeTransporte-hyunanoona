object camion {
    const carga = []
    
    const peso = 1000
    
    method subirAlCamion(paquete) = carga.add(paquete)
    
    method bajarDelCamion(paquete) = carga.remove(paquete)
    
    method peso() = peso + carga.sum{p => p.peso()}
    
    method losPesosSonPares() = carga.all{p => p.peso().even()}
    
    method buscarUnPeso(unPeso) = carga.any{p => p.peso() == unPeso}
    
    method buscarPeligrosidad(unValor) = carga.any{p => p.peligrosidad() == unValor}
    
    method buscarCosasPeligrosas(unValor) = carga.filter{p => p.peligrosidad() > unValor}

    method objetosMasPeligrososQue(unaCosa) = carga.filter{p => p.peligrosidad() > unaCosa.peligrosidad()}

    method excedidoDePeso() = self.peso() > 2500

    method puedeCircularEnRuta(unValor) = not self.excedidoDePeso() and carga.max{p => p.peligrosidad()}.peligrosidad() < unValor

    method algunaCosaEntre(unPeso, otroPeso) = carga.any{p => p.peso().between(unPeso, otroPeso)}

    method cosaMasPesada() = carga.max{c => c.peso()}
}