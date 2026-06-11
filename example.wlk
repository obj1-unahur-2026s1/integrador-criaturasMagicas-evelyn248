class Criatura {

  var poderMagico 
  var property astucia 
  var rolEnELBosque

  method poderOfensivo() {
        return (poderMagico * 10) + rolEnELBosque.extraPoderOfensivo(self)
    }

    method esExtrordinaria(unRol){}


}

class Duende inherits Criatura {
  
  override method poderOfensivo() {
        return super() * 1.10
    }

    method esAstuto() = false



}

class Hada inherits Criatura {
  var kmQuePuedeVolar = 2

  method entrenarVuelo(cantidadKm) {
    kmQuePuedeVolar = (kmQuePuedeVolar + cantidadKm).min(25)
  }

  method esAstuto()= astucia > 50 



}
 
class guardian {

  method extraPoderOfensivo(criatura) = 100
}

class domador {

  var property mascotas = []

  method entrenarMascota(){}

  method extraPoderOfensivo(criatura) = 150 * mascotas.count({ m => m.tieneCuernos() })
}

class hechicero {

  method extraPoderOfensivo(criatura) = 0
}

class MascotaMitologica {
    const property tieneCuernos
    var property edad
    
    method esVeterana() = edad == 10 
}


