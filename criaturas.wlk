class Criatura {

var poderMagico = 9
var astucia = 8
var rolEnElParque = "rol"

method poderOfensivo() = poderMagico * 10 + rolEnElParque.extraPoder(self)
}

class Duende inherits Criatura {
    override method poderOfensivo() = super() * 1.1
}

class Hada inherits Criatura {
    var property puedeVolar = 2

    method cantDeKmQuePuedeVolar(km) {
        puedeVolar = (puedeVolar + km).min(25)
    }
}