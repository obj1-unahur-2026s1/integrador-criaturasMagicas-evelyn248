class Criatura {

    var poderMagico
    var astucia
    var  rolEnElParque

    method poderMagico() = poderMagico

    method poderOfensivo() = poderMagico * 10 + rolEnElParque.extraPoder(self)

    method esFormidable() {
        return self.esAstuta() or self.esExtraordinaria()
    }

    method esAstuta()
    method esExtraordinaria()

    method nuevoRol(unRol) {
        rolEnElParque = unRol
    }

    method perderPoderMagico() = poderMagico - (poderMagico * 1.15)

}

class Duende inherits Criatura {
    override method poderOfensivo() = super() * 1.1

    override method esAstuta()=false    
    
}

class Hada inherits Criatura {
    var puedeVolar = 2

    method cantDeKmQuePuedeVolar(km) {
        puedeVolar = (puedeVolar + km).min(25)
    }

    override method esAstuta()= astucia > 50

    override method esFormidable(){
        return self.esAstuta() and puedeVolar > 10        
    }
 
}

class Guardian {
    
   method extraPoder(criatura) = 100
   method esExtraordinaria(criatura) = criatura.poderMagico() > 50

    //la criatura dejará de apuntar a su rol viejo para apuntar a una nueva instancia (un nuevo objeto) de la clase de rol deseada
   method cambioDeRol(criatura) {
        const nuevoDomador = new Domador()
        const mascotaInicial = new Mascota(edad = 1, tieneCuernos = false)

        nuevoDomador.entrenarMascota(mascotaInicial)

        criatura.nuevoRol(nuevoDomador)
    }

}

class Domador {
    const mascotas = []

    method extraPoder(criatura) = mascotas.count({m => m.tieneCuernos()})*150
    method esExtraordinaria(criatura) = criatura.poderMagico() >= 15 and mascotas.all({m => m.esVeterana()})
    
    method entrenarMascota(unaMascota) = mascotas.add(unaMascota) 

    method cambiarDeRol(criatura) {
        const nuevoHechicero = new Hechicero()
        if (mascotas.any({m => m.tieneCuernos()}))
            criatura.nuevoRol(nuevoHechicero)

    }

}

class Hechicero {

    method extraPoder(criatura) = 0
    method esExtraordinaria(criatura) = true

    method cambiarDeRol(criatura){        
        const nuevoGuardian = new Guardian()
        criatura.nuevoRol(nuevoGuardian)
    }
}

class Mascota {
    var edad
    const property tieneCuernos

    method edad()= edad
    method esVeterana() = edad >= 10
    
}  

class Area {

}

class Castillo {

    var coloniaHabitante
    
    method poderDefensivo() {
        200*coloniaHabitante.cantidadDeCriaturasFormidables()
    }
}

class Claro {

    var  coloniaHabitante
    method poderDefensivo() {
        180+coloniaHabitante.sumaPoderOfensivo()
    }

}

class Colonia {

    const integrantes = []
    var area

    method sumaPoderOfensivo() = integrantes.sum({c => c.poderOfensivo()})
    method cantidadDeCriaturasFormidables() = integrantes.count({c => c.esFormidable()})
    
    method intentarConquistar(unArea) {
        if (self.sumaPoderOfensivo() > unArea.poderDefensivo()) {
            area = unArea
        }
        
        else {   
            integrantes.forEach({c => c.perderPoderMagico()})
        }
    }

}




