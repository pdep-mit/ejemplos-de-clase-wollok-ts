import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.origin()

	method image() {
		if(self.estaAtrapada()){
			return "pepita-gris.png"
		}
		
		return if (self.estaEnElNido())
		 "pepita-grande.png" else "pepita.png"
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
		self.vola(position.distance(nuevaPosicion))
		position = nuevaPosicion
	}

	method caer() {
		const yActual = self.position().y()
		position = game.at(self.position().x(), 0.max(yActual-1))
	}

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		return position == nido.position()
	}

	method estaAtrapada() =
		position == silvestre.position()

}

