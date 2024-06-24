import wollok.game.*
import enemigos.*
import clasesGenerales.*
import configuraciones.*
import obstaculos.*
import niveles.*

const vida1= new Vida(position = game.at(24,14))
const vida2= new Vida(position = game.at(23,14))
const vida3= new Vida(position = game.at(22,14))
const vida4= new Vida(position = game.at(21,14))
const cono1= new Cono(position = game.at(12,1))
const cono2= new Cono(position = game.at(5,1))
const cono3= new Cono(position = game.at(5,9))
const cono4= new Cono(position = game.at(13,9))
const banderaHolandaDeArriba= new BanderaHolanda(position = game.at(9,14), image = "banderaHolanda.jpg")
const banderaAlemaniaDeArriba= new BanderaAlemania(position = game.at(11,14), image = "banderaAlemania.jpg")
const banderaFranciaDeArriba= new BanderaFrancia(position = game.at(13,14), image = "banderaFrancia.jpg")

const banderaHolandaObjetivo=new BanderaHolanda(position = game.at(0,9), image = "banderaHolanda.jpg")
const banderaAlemaniaObjetivo=new BanderaAlemania(position = game.at(0,9), image = "banderaAlemania.jpg")
const banderaFranciaObjetivo= new BanderaFrancia(position = game.at(0,9), image = "banderaFrancia.jpg")

object jugador {
	
	var property position = self.posicionInicial()
	var property image = "jugador.png"
	var vidasJugador = [vida1, vida2, vida3, vida4]
	
	method posicionInicial()=game.at(24,1)
	method reestablecer(){
		position = self.posicionInicial()
		suelo.nivelSuelo(1)
		suelo.position(game.origin().up(suelo.nivelSuelo()))
		vidasJugador.clear()
		vidasJugador = [vida1, vida2, vida3, vida4]
		self.agregarObjeto(estrella)
		self.agregarObjeto(vida1)
		self.agregarObjeto(vida2)
		self.agregarObjeto(vida3)
		self.agregarObjeto(vida4)
		
	}
	method agregarObjeto(unObjeto){
		if (not game.hasVisual(unObjeto)){
			game.addVisual(unObjeto)
		}
	}

	
	method estaVivo(){
		return not vidasJugador.isEmpty()
	}
	
	method vidasJugador()= vidasJugador
	method agregarVida(unaVida){ vidasJugador.add(unaVida)}
	
	method quitarVida(){
		if( not vidasJugador.isEmpty()){
			game.removeVisual(self.ultimaVida())
		    vidasJugador.remove(self.ultimaVida())
		}
		else {gameOver.perderEtapa()}
	}
	
	method perderPorTiempo(){
		if(reloj.tiempoPerder()){
			game.addVisual(gameOver)
		}
	}
	
	method ultimaVida(){
		return vidasJugador.first()
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
	
	method agarrarEstrellaSiHay(){
	  if (position == estrella.position() && game.hasVisual(estrella)){
	    game.removeVisual(estrella)
	    game.say(self, "Genial, tienes la estrella")
	  }
	}
	
	
	//// movimientos del jugador 
	
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
			self.agarrarEstrellaSiHay()
		}	
	}
	
	method moverALaDerecha(){
		self.image("jugador_mirando_derecha.png")
		if(position.x()<24){
			position = position.right(1)
			self.agarrarEstrellaSiHay()
		}
	}
		
}