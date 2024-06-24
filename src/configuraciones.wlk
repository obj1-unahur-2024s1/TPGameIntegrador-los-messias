import wollok.game.*
import jugador.*
import estrella.*
import enemigos.*
import obstaculos.*
import niveles.*

object imagenIntroduccion {
	
	const property image = "instrucciones.png"
	var property position = game.center()

}


object configuracion{
	
   method introduccion(){
	game.addVisual(imagenIntroduccion)
	game.width(25)
	game.height(15)
	game.cellSize(50)
	game.title("El Messias")
	game.boardGround("fondo.png")
	keyboard.enter().onPressDo({nivel1.configNivel1()})
    }
    
    method reiniciar(){
     game.removeVisual(gameOver)
     reloj.detener()
     reloj.iniciar()
     jugador.reestablecer()
    }
	
	method iniciar(){
	game.removeVisual(nivel1)
	game.addVisual(jugador)
	game.addVisual(estrella)
	game.addVisual(reloj)
	game.addVisual(cruyff)
	game.addVisual(cruyff1)
	game.addVisual(cruyff2)
	game.addVisual(jugador.vidasJugador().get(0))
	game.addVisual(jugador.vidasJugador().get(1))
	game.addVisual(jugador.vidasJugador().get(2))
	game.addVisual(jugador.vidasJugador().get(3))
	game.addVisual(cono1)
	game.addVisual(cono2)
	game.addVisual(cono3)
	game.addVisual(cono4)
	game.onTick(1000,"perder",{jugador.perderPorTiempo()})
	game.onTick(2000,"moverse",{cruyff.moverseAleatoriamente()})
	game.onTick(2000,"moverse",{cruyff1.moverseAleatoriamente()})
	game.onTick(2000,"moverse",{cruyff2.moverseAleatoriamente()})
	game.onCollideDo(jugador,{ jug =>jug.chocar()})
	game.addVisual(banderaHolandaDeArriba)
	game.addVisual(banderaAlemaniaDeArriba)
	game.addVisual(banderaFranciaDeArriba)
	game.addVisual(banderaHolandaObjetivo)
	}	
}

object teclado{
	method comandosTeclado(){
	keyboard.s().onPressDo{jugador.siguienteEscalon()}
	keyboard.up().onPressDo{jugador.saltar()}
	keyboard.left().onPressDo{jugador.moverALaIzquierda()}
	keyboard.right().onPressDo{jugador.moverALaDerecha()}
	keyboard.space().onPressDo{configuracion.reiniciar()}
	}
}

object reloj {
	var tiempo = 0
	
	method tiempoPerder()= tiempo == 120
	
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
