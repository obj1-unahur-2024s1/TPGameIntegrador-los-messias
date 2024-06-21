import wollok.game.*
import jugador.*
import estrella.*
import enemigos.*

object imagenIntroduccion {
	
	const property image = "instrucciones.png"
	var property position = game.center()

	method introduccion(){
		game.addVisual(self)
		game.width(25)
		game.height(15)
		game.cellSize(50)
		game.title("El Messias")
		game.boardGround("fondo.png")
		keyboard.enter().onPressDo({nivel1.configNivel1()})
	}
}

object nivel1{
	const property image = "nivel1.png"
	var property position = game.at(2,2)
	
	method configNivel1(){
	game.removeVisual(imagenIntroduccion)
	game.addVisual(self)
	keyboard.num1().onPressDo({configuracion.iniciar()})
	}

}


object configuracion{
	method iniciar(){
	game.removeVisual(nivel1)
	game.addVisual(jugador)
	game.addVisual(estrella)
	game.addVisual(reloj)
	game.addVisual(enemigo)
	game.addVisual(vida1)
	game.addVisual(vida2)
	game.addVisual(vida3)
	game.addVisual(vida4)
	game.onTick(1000,"moverse",{enemigo.moverseAleatoriamente()})
	game.whenCollideDo(jugador,{ jugador =>
		jugador.quitarVida(vida1)
	})
	}
}

object teclado{
	method comandosTeclado(){
	keyboard.s().onPressDo{jugador.siguienteEscalon()}
	keyboard.up().onPressDo{jugador.saltar()}
	keyboard.left().onPressDo{jugador.moverALaIzquierda()}
	keyboard.right().onPressDo{jugador.moverALaDerecha()}
	}
}

object reloj {
	var tiempo = 0
	
	method text() = tiempo.toString()
	method position() = game.at(2, game.height()-1)
	
	method pasarTiempo() {
		tiempo = tiempo +1
	}
	method iniciar(){
		tiempo = 0
		game.onTick(1000,"tiempo",{self.pasarTiempo()})
	}
	method detener(){
		game.removeTickEvent("tiempo")
	}
}


object suelo{
	var nivelSuelo = 1
	var property position = game.origin().up(nivelSuelo)
	method subirNivel(){
		nivelSuelo = nivelSuelo + 4
		position =  game.origin().up(nivelSuelo)
	}
}
