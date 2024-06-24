import wollok.game.*
import jugador.*
import enemigos.*
import clasesGenerales.*

class Cono{/*o class Obstaculos (abstracta) y class Cono inherits Obstaculos */	
	const property position
	var property image="cono.png"
	var property hayCono=true
	
	
	method chocar(){
		if(self.position()==jugador.position()){jugador.quitarVida()}
		
	
		
	/*anterior posicion para que no queden superpuestos,efecto rebote y que solo le saque una */
	}
}