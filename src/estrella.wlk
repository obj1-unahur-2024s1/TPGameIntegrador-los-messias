import wollok.game.*

object estrella{
	
	method valor() {return 1} 
	
	method position(){return  game.center()}
	
	method image(){return "estrella.png"}
}

class Vida{
	var property image = "pelota23x23.png"
	var property position = game.center()
}