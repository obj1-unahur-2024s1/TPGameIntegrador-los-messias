import wollok.game.*
import jugador.*
import configuraciones.*
import clasesGenerales.*
import obstaculos.*

const cruyff= new EnemigoHolanda(position = game.at(6,1),listaConos=[cono1,cono2,cono3,cono4])
const cruyff1= new EnemigoHolanda(position = game.at(12,5),listaConos=[cono1,cono2,cono3,cono4])
const cruyff2= new EnemigoHolanda(position = game.at(20,9),listaConos=[cono1,cono2,cono3,cono4])

const becken = new EnemigoAlemania(position = game.at(6,1), listaConos=[cono1,cono2,cono3,cono4])
const becken1 = new EnemigoAlemania(position = game.at(3,5), listaConos=[cono1,cono2,cono3,cono4])
const becken2 = new EnemigoAlemania(position = game.at(8,9), listaConos=[cono1,cono2,cono3,cono4])
const becken3 = new EnemigoAlemania(position = game.at(21,9), listaConos=[cono1,cono2,cono3,cono4])
const becken4 = new EnemigoAlemania(position = game.at(18,5), listaConos=[cono1,cono2,cono3,cono4])
const becken5 = new EnemigoAlemania(position = game.at(20,1), listaConos=[cono1,cono2,cono3,cono4])

const mbappe = new EnemigoFrancia(position = game.at(6,1), listaConos=[cono1,cono2,cono3,cono4])
const mbappe1 = new EnemigoFrancia(position = game.at(4,5), listaConos=[cono1,cono2,cono3,cono4])
const mbappe2 = new EnemigoFrancia(position = game.at(8,9), listaConos=[cono1,cono2,cono3,cono4])
const mbappe3 = new EnemigoFrancia(position = game.at(21,9), listaConos=[cono1,cono2,cono3,cono4])
const mbappe4 = new EnemigoFrancia(position = game.at(14,5), listaConos=[cono1,cono2,cono3,cono4])
const mbappe5 = new EnemigoFrancia(position = game.at(20,1), listaConos=[cono1,cono2,cono3,cono4])
const mbappe6 = new EnemigoFrancia(position = game.at(3,1), listaConos=[cono1,cono2,cono3,cono4])
const mbappe7 = new EnemigoFrancia(position = game.at(17,9), listaConos=[cono1,cono2,cono3,cono4])
const mbappe8 = new EnemigoFrancia(position = game.at(20,5), listaConos=[cono1,cono2,cono3,cono4])




class Enemigo{
	var property position/* = game.at(4,1)*/
	var direccionAleatoria="Derecha"
	var property listaConos=[]
	
	method verificarConosDerecha()=listaConos.any({c=>c.position().x()== position.x()+1 && c.position().y()== position.y()})
	
	method verificarConosIzquierda()=listaConos.any({c=>c.position().x()== position.x()-1 && c.position().y()== position.y()})
	
	method derechaOIzquierda(){
		const lista= ["Derecha","Izquierda","Derecha","Izquierda"]
		direccionAleatoria = lista.anyOne() 
	}
	
	method moverseAleatoriamente(){
		self.derechaOIzquierda()
		if(direccionAleatoria == "Derecha"){
			self.moverALaDerecha()
			game.schedule(1000,{self.moverALaDerecha()})
		}else{self.moverALaIzquierda()
			game.schedule(1000,{self.moverALaIzquierda()})
		}
		
	}
	
	method moverALaIzquierda()
	method moverALaDerecha()
	

		method chocar(){
		if (self.position()==jugador.position()){
			jugador.quitarVida()}}
		/*	else if (self.position()==unCono.position()){self.cambiarDireccion()}
			
	
	}*/
	
	}
	
	
	
class EnemigoHolanda inherits Enemigo{
	var property image = "CRUYFF.png"
	
	
	override method moverALaDerecha(){
		self.image("CRUYFFder.png")
		if(position.x()<20 && not self.verificarConosDerecha()){
			position = position.right(1)
			
			}}
	 override method moverALaIzquierda(){
		self.image("CRUYFF.png")
		if(position.x()>4&& not self.verificarConosIzquierda()){
			position = position.left(1)
		}
		
		}
		
		}
	
	
class EnemigoFrancia inherits Enemigo{
	var property image = "mbappeder.png"
	
	 override method moverALaDerecha(){
		self.image("mbappeder.png")
		if(position.x()<20&& not self.verificarConosDerecha()){
			position = position.right(1)
	}
	}
	override method moverALaIzquierda(){
		self.image("mbappeizq.png")
		if(position.x()>4&& not self.verificarConosIzquierda()){
			position = position.left(1)
		}
		}
}
	
	
class EnemigoAlemania inherits Enemigo{
	var property image = "BECKEN.png"
		
		override method moverALaDerecha(){
		self.image("BECKENder.png")
		if(position.x()<20&& not self.verificarConosDerecha()){
			position = position.right(1)
		}
		}
		
		override method moverALaIzquierda(){
		self.image("BECKEN.png")
		if(position.x()>4&& not self.verificarConosIzquierda()){
			position = position.left(1)
		}		
	    }

}
