import wollok.game.*
import enemigos.*
import estrella.*
import configuraciones.*

const vida1= new Vida(position = game.at(24,14))
const vida2= new Vida(position = game.at(23,14))
const vida3= new Vida(position = game.at(22,14))
const vida4= new Vida(position = game.at(21,14))



object jugador {
	var property position = game.at(24,1)
	var property image = "jugador.png"
	
	const vidasJugador = [vida1, vida2, vida3, vida4]
	method vidasJugador()= vidasJugador
	method agregarVida(unaVida){ vidasJugador.add(unaVida)}
	method quitarVida(unaVida){
		if( not vidasJugador.isEmpty())
		game.removeVisual(unaVida)
		vidasJugador.remove(unaVida)
	}
	
	method image(unaImagen){ image = unaImagen}
	method image()= image
	
	method siguienteEscalon(){ //SUBE AL SIGUIENTE ESCALON SOLO POR LAS ESCALERAS
		if (position == game.at(0,1) or position == game.at(24,5)){
		position = position.up(4)
		suelo.subirNivel()}
	}
	
	method saltar(){ 
		if (position.y() == suelo.position().y()){
			self.subir()
		if(image == "jugador.png"){
			self.moverALaIzquierda()	
		}else{
			self.moverALaDerecha()
		}
		
		game.schedule(500, {self.bajar()})		
	}}
	
	method bajar(){
		if (position.y() != suelo.position().y()){
		position = position.down(2)
	    }
	}
	method subir(){
		position = position.up(2)
	}
	
	method moverALaIzquierda(){
		self.image("jugador.png")
		if(position.x()>0){
			position = position.left(1)
		}	
	}
	
	method moverALaDerecha(){
		self.image("jugador_mirando_derecha.png")
		if(position.x()<24){
			position = position.right(1)
		}
	}
		
}