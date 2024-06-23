import wollok.game.*
import jugador.*
import enemigos.*
import estrella.*

class Cono {
	const property position 
	var property image ="cono.png.jpeg"
	
	
	method chocar(){
		if (self.position()==jugador.position()){jugador.quitarVida()}	
		}
}
  