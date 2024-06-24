import wollok.game.*
import jugador.*
import configuraciones.*
import enemigos.*
import obstaculos.*
import niveles.*

object estrella{
	//var contadorEstrellas = 0
	var property position = game.at (9,1)
	
	//method contadorEstrellas()= contadorEstrellas
	//method contadorEstrella(){contadorEstrellas += 1}
	method image(){return "estrella.png"}
	method chocar(){jugador.agarrarEstrellaSiHay()}
	//method valor() {return 1} 
	}
   
class Vida{
	var property image = "pelota23x23.png"
	var property position = game.center()
}

class Bandera{
	var property position
	var property image
	
	method cambiarAEstrella(){
		image = "estrella.png"
	}
	method chocar()
}

class BanderaHolanda inherits Bandera{
	override method chocar(){
		if (not game.hasVisual(estrella)){
		banderaHolandaDeArriba.cambiarAEstrella()
		nivel2.iniciarNivel2() }
		else{game.say(jugador, "Olvidaste agarrar la estrella")}
	}
}

class BanderaAlemania inherits Bandera{
	override method chocar(){		
		if (not game.hasVisual(estrella)){
			banderaAlemaniaDeArriba.cambiarAEstrella()
			nivel3.iniciarNivel3()
		}
		else{game.say(jugador, "Olvidaste agarrar la estrella")}
	}	
}

class BanderaFrancia inherits Bandera{
	override method chocar(){
		if (not game.hasVisual(estrella)){
		banderaFranciaDeArriba.cambiarAEstrella()
		game.addVisual(finDelJuego)
		reloj.detener()
		}else{game.say(jugador, "Olvidaste agarrar la estrella")}
		}
}