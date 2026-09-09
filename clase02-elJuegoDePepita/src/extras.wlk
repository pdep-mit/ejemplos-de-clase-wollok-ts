import pepita.*
import wollok.game.*

object nido {

	var property position = game.at(7, 8)

	method image() = "nido.png"

	method teEncontro(ave) {
		game.stop()
	}
}

object silvestre {

	method image() = "silvestre.png"

	method position() {
		const posicionDePepita = pepita.position()
		const xDeSilvestre = 
			posicionDePepita.x().max(3)
		return game.at(xDeSilvestre, 0)
	} 
	method teEncontro(ave) {
		game.say(ave, "Oh! No! Me atraparon!")
	}
}

