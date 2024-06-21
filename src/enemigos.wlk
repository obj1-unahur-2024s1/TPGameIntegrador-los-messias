import wollok.game.*

object enemigo{
	var property position = game.at(4,1)
	var property image = "cristiano_mirando_derecha.png"
	var direccionAleatoria
	
	method derechaOIzquierda(){
		const lista= ["Derecha","Izquierda","Derecha","Derecha","Izquierda"]
		direccionAleatoria = lista.anyOne() 
	}
	
	method moverseAleatoriamente(){
		self.derechaOIzquierda()
		if(direccionAleatoria == "Derecha"){
			self.moverALaDerecha()
			game.schedule(750,{self.moverALaDerecha()})
		}else{self.moverALaIzquierda()
			game.schedule(750,{self.moverALaIzquierda()})
		}
		
	}
	
	method moverALaIzquierda(){
		self.image("cristiano.png")
		if(position.x()>4){
			position = position.left(1)
		}
		
	}
	
	method moverALaDerecha(){
		self.image("cristiano_mirando_derecha.png")
		if(position.x()<20){
			position = position.right(1)
		}
}
}