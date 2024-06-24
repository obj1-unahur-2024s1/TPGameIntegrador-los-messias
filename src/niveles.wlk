import wollok.game.*
import jugador.*
import estrella.*
import enemigos.*
import obstaculos.*
import configuraciones.*


object gameOver{
	
   var property image = "gameOver.png"
   var property position = game.at(2,2)
   
   method perderEtapa(){
   	  if ( not jugador.estaVivo()){
	  game.addVisual(self)
	  }
	  }
	}
   

object nivel1{
	
	var property image = "nivel1.png"
	var property position = game.at(2,2)
	
	method configNivel1(){
	  game.removeVisual(imagenIntroduccion)
	  game.addVisual(self)
	  keyboard.num1().onPressDo({configuracion.iniciar()})
	}
}

object introNivel2{
	var property position = game.at(2,2)
	var property image = "nivel2.png"
}


object nivel2{
	
	method iniciarNivel2(){
	game.clear()
	//jugador.reestablecer()
	game.addVisual(introNivel2)
	keyboard.num2().onPressDo({self.configNivel2()})
	
	}
	
	method configNivel2(){
		game.removeVisual(introNivel2)
		estrella.position(game.at(5,2))
		reloj.iniciar()
		teclado.comandosTeclado()
		game.addVisual(banderaAlemaniaObjetivo)
		game.addVisual(banderaHolandaDeArriba)
		game.addVisual(banderaAlemaniaDeArriba)
		game.addVisual(banderaFranciaDeArriba)
		game.addVisual(jugador)
		jugador.reestablecer()
		game.addVisual(reloj)
		game.addVisual(estrella)
		game.addVisual(cono1)
		game.addVisual(cono2)
		game.addVisual(cono3)
		game.addVisual(cono4)
		game.addVisual(becken)
		game.addVisual(becken1)
		game.addVisual(becken2)
		jugador.position(game.at(24,1))
		game.onTick(1000,"perder",{jugador.perderPorTiempo()})
		game.onTick(1500,"moverse",{cruyff.moverseAleatoriamente()})
		game.onTick(1500,"moverse",{cruyff1.moverseAleatoriamente()})
		game.onTick(1500,"moverse",{cruyff2.moverseAleatoriamente()})
		game.onTick(1500,"moverse",{becken.moverseAleatoriamente()})
		game.onTick(1500,"moverse",{becken1.moverseAleatoriamente()})
		game.onTick(1500,"moverse",{becken2.moverseAleatoriamente()})
		game.onCollideDo(jugador,{ jug =>jug.chocar()})
	}
}



