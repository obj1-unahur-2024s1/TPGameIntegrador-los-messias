import wollok.game.*
import jugador.*
import clasesGenerales.*
import enemigos.*
import obstaculos.*
import niveles.*

object imagenIntroduccion {
	
	const property image = "instrucciones.png"
	var property position = game.center()

}

object finDelJuego{
	var property position = game.at(2,2)
	method image()="finDelJuego.png"
}


object sonido{
	var sonido = game.sound("juego.mp3")
   
   method sonidoFondo(){ 
	sonido.shouldLoop(true)
	game.schedule(500,{sonido.play()})
   }

   method mutearFondo(){
   	sonido.stop()
   	sonido = game.sound("juego.mp3")
   }
}


object configuracion{
	
   method introduccion(){
	game.addVisual(imagenIntroduccion)
	game.width(25)
	game.height(15)
	game.cellSize(50)
	game.title("El Messias")
	game.boardGround("fondo.png")
	sonido.sonidoFondo()
	keyboard.enter().onPressDo({self.estaIntroduccion()})
    }
    
    method estaIntroduccion(){
    	if(game.hasVisual(imagenIntroduccion)){nivel1.configNivel1()
    	game.sound("Comienzo.mp3").play()
    	}
    }
    
    method reiniciar(){
     game.removeVisual(gameOver)
     reloj.iniciar()
     jugador.reestablecer()
    }
	
	method iniciar(){
	reloj.iniciar()
	teclado.comandosTeclado()
	game.removeVisual(nivel1)
	game.addVisual(jugador)
	suelo.nivelSuelo(1)
    suelo.position(game.origin().up(suelo.nivelSuelo()))
	estrella.position(game.at(9,1))
	jugador.reestablecer()
	game.addVisual(reloj)
	game.addVisual(cruyff)
	game.addVisual(cruyff1)
	game.addVisual(cruyff2)
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
	keyboard.space().onPressDo{self.estaGameOver()}
	keyboard.r().onPressDo{
		if(not game.hasVisual(finDelJuego)){sonido.mutearFondo()
		    game.clear()
			configuracion.introduccion()
			banderaHolandaDeArriba.image("banderaHolanda.jpg")
			banderaAlemaniaDeArriba.image("banderaAlemania.jpg")
			banderaFranciaDeArriba.image("banderaFrancia.jpg")
			}
		    }
	}
	method estaGameOver(){
		if(game.hasVisual(gameOver)){configuracion.reiniciar()}
	}
}

object reloj {
	var property tiempo
	
	method tiempoPerder()= tiempo == 0
	
	method text() = tiempo.toString()
	method position() = game.at(2, game.height()-1)
	
	method pasarTiempo() {
		tiempo = tiempo - 1
	}
	method iniciar(){
		tiempo = 100
		game.onTick(1000,"tiempo",{self.pasarTiempo()})
	}
	method detener(){
		game.removeTickEvent("tiempo")
	}
}


object suelo{
	var property nivelSuelo = 1
	var property position = game.origin().up(nivelSuelo)
	
	method subirNivel(){
		nivelSuelo = nivelSuelo + 4
		position =  game.origin().up(nivelSuelo)
	}
}
