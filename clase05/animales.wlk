

class Mamifero {
	var property peso

	method esPesado() = peso > 50

	method caminar(tiempo) {
		peso -= tiempo * self.pesoQuePierdeCaminandoPorHora()
	}

	method pesoQuePierdeCaminandoPorHora()

}

class Vaca inherits Mamifero {

	var property tieneSed = false

	method tieneHambre() = peso < 200

	method beber() {
		tieneSed = false
		peso -= 0.5
	}

	method comer(racion) {
		peso += racion / 3
		tieneSed = true
	}
	
	override method pesoQuePierdeCaminandoPorHora() = 0.2
}

class Cerdo inherits Mamifero {

	var property tieneHambre = false
	var vecesQueComioSinBeber = 0

	method tieneSed() = vecesQueComioSinBeber > 3

	method beber() {
		tieneHambre = true
		vecesQueComioSinBeber = 0
	}

	method comer(racion) {
		peso += (racion - 0.2).max(0)
		vecesQueComioSinBeber += 1
		if (racion > 1) {
			tieneHambre = false
		}
	}
	
	override method pesoQuePierdeCaminandoPorHora()
		= if(self.tieneHambre()) 0.5 else 0.3
}

object puercoArania inherits Cerdo(peso = 75) {
  var property patasSucias = false
  override method tieneSed() {
    return patasSucias || super()
  }
  override method caminar(tiempo) {
    super(tiempo)
    if(tiempo > 1) patasSucias = true
  }
}


// Las gallinas quedan igual que la clase anterior
class Gallina {
	method peso() = 4
	method tieneHambre() = true
	method tieneSed() = false
	
	// Cuando bebe no se observa ningún cambio.
	method beber(){ }
	// Cuando come no se observa ningún cambio.
	method comer(kilos){ }
}
