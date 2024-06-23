import wollok.game.*
import jugador.*
import configuraciones.*
import enemigos.*
import obstaculos.*
import niveles.*

object estrella{
	var contadorEstrellas = 0
	
	method contadorEstrellas()= contadorEstrellas
	method contadorEstrella(){
		contadorEstrellas += 1
	}
	method image(){return "estrella.png"}
	method valor() {return 1} 
	method position(){return  game.at (9,1)}
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
		banderaHolandaDeArriba.cambiarAEstrella()
		//pasar de nivel 
	}
}

class BanderaAlemania inherits Bandera{
	override method chocar(){
		banderaAlemaniaDeArriba.cambiarAEstrella()
		//pasar de nivel 
	}	
}

class BanderaFrancia inherits Bandera{
	override method chocar(){
		banderaFranciaDeArriba.cambiarAEstrella()
		//ganar nivel 
	}
}