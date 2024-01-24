import granja.*
import prompts.*
import excepciones.*
import wollok.game.*

object juegoGranja {
	method seAtiende(animal, dispositivo) {
		try {
			// Lógica que puede fallar por motivos diversos
			granja.daAtencion(dispositivo, animal)
		} catch e: NoHayRacionesException {
			(new PromptRecargar(recargable = dispositivo))
				.mostrar()
			// Se muestra el cartelito para ofrecer la recarga
		} catch e: DomainException {
			// Otras excepciones de dominio se vuelven a lanzar,
			// para usar el comportamiento por defecto de Wollok Game
			// de mostrar el mensajito en rojo
			
			// Si se quisiera manejar de otra forma la excepción
			// GranjaEnQuiebraException (podría indicar que perdiste)
			// se podría hacer agregando otro catch previo a este
			throw e
		} catch e: Exception {
			// Sólo queremos mostrar el cartel para salir del juego
			// cuando falló por algo inesperado.
			// Cualquier excepción que no sea de dominio entra por acá
			promptError.mostrar()
		}
	}
	method recargar(recargable) {
		granja.recargar(recargable) 
		game.say(recargable, "¡Recargado!")
	}
}