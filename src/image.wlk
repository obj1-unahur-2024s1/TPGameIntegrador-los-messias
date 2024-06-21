import wollok.game.*

object image {
	
	var property image = "instrucciones.png"
	var property position = game.center()
	method fondoInstrucciones(){ 
		game.width(25)
		game.height(15)
		game.boardGround(image)
	}
	

}
