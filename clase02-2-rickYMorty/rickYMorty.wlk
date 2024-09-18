// ALIENS

object gromflomite {
	var property energia = 100
	method recibirDanio(danio){
		energia = energia-danio/5
	}
	method poder() = 50
}

object glorzo {
	var property anfitrion = gromflomite
	method recibirDanio(danio){
		anfitrion.energia(anfitrion.energia() - danio)
	}
	method poder() = anfitrion.poder()
}

// RICK Y MORTY

object rick {
  var property energia = 100
  var poderBase = 200
  method poder() = poderBase + self.poderDePistola()
  method poderDePistola() = 50
  method atacar(contrincante){
	if(self.poder() > contrincante.poder()){
		poderBase += 10
	} else {
		energia -= 50
	}
	contrincante.recibirDanio(self.poder())
  }
}

object morty {
  var property energia = 50
  const poderBase = 100
  method poder() = poderBase * if(not self.estaTraumado()) 1 else 3
  method atacar(contrincante){
	energia -= 10
  }
  method estaTraumado() = self.energia() < 30
}



