import wollok.game.*
import obstaculos.*

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