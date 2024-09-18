object pepita {
	var energia = 100
	
	method energia() {
		return energia
	}
	
	method volar(kilometros){
		energia = energia - 40 - 5 * kilometros
	}
	
	method comer(gramos){
		energia = energia + 2 * gramos
	}
}

 object josefa {
 	var gramosComidos = 0
 	var kilometrosVolados = 0
 	const energiaInicial = 80
 	
 	method energia(){
 		return energiaInicial + 5 * gramosComidos - 3 * kilometrosVolados
 	}
 	method comer(gramos){
 		gramosComidos = gramosComidos + gramos
 	}
 	method volar(kilometros){
 		kilometrosVolados = kilometrosVolados + kilometros
 	}
 	
 	method estadoEmocional(){
 		if(gramosComidos > kilometrosVolados)
 		  return "Bonita y gordita"
 		if(energiaInicial < self.energia())
 		  return "Energica"
 		if(self.volo() && not self.comio())
 		  return "Explotada"
 		return "Indiferente"
 	}
 	
 	method comio(){
 		return gramosComidos > 0
 	}
 	
 	method volo(){
 		return kilometrosVolados > 0
 	}
 }

object entrenador {
 	method entrenar(pajaro){
 		pajaro.comer(10)
 		pajaro.volar(20)
 		if(pajaro.energia() < 20){
 			pajaro.comer(10)
 		} else {
 			pajaro.comer(2)
 		}
 	}
 }
 

object beti {
	var companiera = pepita
	method companiera(nuevaCompaniera){
		companiera = nuevaCompaniera
	}
	method comer(gramos){
		companiera.comer(gramos/2)
	}
	method volar(kms){
		companiera.volar(kms)
	}
	method energia(){
		return companiera.energia()
	}
}