import wollok.game.*

object enemigo{
	var property position = game.at(0,1)
	var property image = "ronaldo.arg.png"
	var direccionAleatoria
	
	method derechaOIzquierda(){
		const lista= ["Derecha","Izquierda","Derecha","Derecha","Izquierda"]
		direccionAleatoria = lista.anyOne() 
	}
	
	method moverseAleatoriamente(){
		self.derechaOIzquierda()
		if(direccionAleatoria == "Derecha"){
			self.moverALaDerecha()
		}else{self.moverALaIzquierda()}
		
	}
	
	method moverALaIzquierda(){
		self.image("ronaldo.arg.png")
		if(position.x()>0){
			position = position.left(1)
		}
		
	}
	
	method moverALaDerecha(){
		self.image("ronaldo.arg.png")
		if(position.x()<20){
			position = position.right(1)
		}
}
}