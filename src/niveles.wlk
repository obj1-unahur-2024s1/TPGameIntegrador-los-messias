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
   	  if ( not jugador.estaVivo() or reloj.tiempo()== 5 ){
	  game.addVisual(self)
	  keyboard.space().onPressDo{configuracion.reiniciar()}
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
