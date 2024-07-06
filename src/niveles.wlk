import wollok.game.*
import jugador.*
import clasesGenerales.*
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
	
	var property position = game.at(2,2)
	method image()= "nivel1.png"
	
	method configNivel1(){
	  game.removeVisual(imagenIntroduccion)
	  game.addVisual(self)
	  keyboard.num1().onPressDo({self.estaIntro1()})
	  
	}
	method estaIntro1(){
		if(game.hasVisual(self)){configuracion.iniciar()}
	}
}

object introNivel2{
	var property position = game.at(2,2)
	method image() = "nivel2.png"
}


object nivel2{
	
	method iniciarNivel2(){
	game.clear()
	game.addVisual(introNivel2)
	keyboard.num2().onPressDo({self.estaIntro2()})
	}
	
	method estaIntro2(){
		if(game.hasVisual(introNivel2)){self.configNivel2()}		
	}
	
	method configNivel2(){
		game.removeVisual(introNivel2)
		teclado.comandosTeclado()
		suelo.nivelSuelo(1)
		suelo.position(game.origin().up(suelo.nivelSuelo()))
		estrella.position(game.at(15,5))
		reloj.iniciar()
		sonido.mutearFondo()
		sonido.sonidoFondo()
		game.addVisual(banderaAlemaniaObjetivo)
		game.addVisual(banderaHolandaDeArriba)
		game.addVisual(banderaAlemaniaDeArriba)
		game.addVisual(banderaFranciaDeArriba)
		game.addVisual(jugador)
		jugador.reestablecer()
		game.addVisual(reloj)
		game.addVisual(cono1)
		game.addVisual(cono2)
		game.addVisual(cono3)
		game.addVisual(cono4)
		game.addVisual(becken)
		game.addVisual(becken1)
		game.addVisual(becken2)
		game.addVisual(becken3)
		game.addVisual(becken4)
		game.addVisual(becken5)
		game.onTick(1000,"perder",{jugador.perderPorTiempo()})
		game.onTick(1500,"moverse",{becken.moverseAleatoriamente()})
		game.onTick(1500,"moverse",{becken1.moverseAleatoriamente()})
		game.onTick(1500,"moverse",{becken2.moverseAleatoriamente()})
		game.onTick(1500,"moverse",{becken3.moverseAleatoriamente()})
		game.onTick(1500,"moverse",{becken4.moverseAleatoriamente()})
		game.onTick(1500,"moverse",{becken5.moverseAleatoriamente()})
		game.onCollideDo(jugador,{ jug =>jug.chocar()})
	}
}


object introNivel3{
	var property position = game.at(2,2)
	method image()="nivel3.png"
}

object nivel3{
	method iniciarNivel3(){
		game.clear()
		game.addVisual(introNivel3)
		keyboard.num3().onPressDo({self.estaIntro3()})
	}
	
	method estaIntro3(){
		if(game.hasVisual(introNivel3)){self.configNivel3()}		
	}
	
	method configNivel3(){
		game.removeVisual(introNivel3)
		teclado.comandosTeclado()
		suelo.nivelSuelo(1)
		suelo.position(game.origin().up(suelo.nivelSuelo()))
		estrella.position(game.at(15,9))
		reloj.iniciar()
		sonido.mutearFondo()
		sonido.sonidoFondo()
		game.addVisual(banderaFranciaObjetivo)
		game.addVisual(banderaHolandaDeArriba)
		game.addVisual(banderaAlemaniaDeArriba)
		game.addVisual(banderaFranciaDeArriba)
		game.addVisual(jugador)
		jugador.reestablecer()
		game.addVisual(reloj)
		game.addVisual(cono1)
		game.addVisual(cono2)
		game.addVisual(cono3)
		game.addVisual(cono4)
		game.addVisual(mbappe)
		game.addVisual(mbappe1)
		game.addVisual(mbappe2)
		game.addVisual(mbappe3)
		game.addVisual(mbappe4)
		game.addVisual(mbappe5)
		game.addVisual(mbappe6)
		game.addVisual(mbappe7)
		game.addVisual(mbappe8)
		jugador.position(game.at(24,1))
		game.onTick(1000,"perder",{jugador.perderPorTiempo()})
		game.onTick(1500,"moverse",{mbappe.moverseAleatoriamente()})
		game.onTick(1500,"moverse",{mbappe1.moverseAleatoriamente()})
		game.onTick(1500,"moverse",{mbappe2.moverseAleatoriamente()})
		game.onTick(1500,"moverse",{mbappe3.moverseAleatoriamente()})
		game.onTick(1500,"moverse",{mbappe4.moverseAleatoriamente()})
		game.onTick(1500,"moverse",{mbappe5.moverseAleatoriamente()})
		game.onTick(1500,"moverse",{mbappe6.moverseAleatoriamente()})
		game.onTick(1500,"moverse",{mbappe7.moverseAleatoriamente()})
		game.onTick(1500,"moverse",{mbappe8.moverseAleatoriamente()})
		
		game.onCollideDo(jugador,{ jug =>jug.chocar()})
	}
}



