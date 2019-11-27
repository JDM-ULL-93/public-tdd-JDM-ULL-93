require 'gema'

class Dieta < ListaDobleEnlazada
 
	@@alimentos = Alimento.constructHashFromFile(%W{Carne\sde\svaca 21.1 0.0 3.1 50.0 164.0 Carne\sde\scordero 18.0 0.0 17.0 20.0 185.0 Camarones\s(piscifactoría) 17.6 1.5 0.6 18.0 2.0 Chocolate 5.3 47.0 30.0 2.3 3.4 Salmón\s(piscifactoría) 19.9 0.0 13.6 6.0 3.7 Cerdo 21.5 0.0 6.3 7.6 11.0 Pollo 20.6 0.0 5.6 5.7 7.1 Queso 25.0 1.3 33.0 11.0 41.0 Cerveza 0.5 3.6 0.0 0.24 0.22 Leche\sde\svaca 3.3 4.8 3.2 3.2 8.9 Huevos 13.0 1.1 11.0 4.2 5.7 Café 0.1 0.0 0.0 0.4 0.3 Tofu 8.0 1.9 4.8 2.0 2.2 Lentejas 23.5 52.0 1.4 0.4 3.4 Nuez 20.0 21.0 54.0 0.3 7.9})	
	def Dieta.alimentos
		return @@alimentos
	end

	
	def emisiones
		result = 0
		self.each(){|value| result+= value.gei }
		return result
	end 
	
	def terreno
		result = 0
		self.each(){|value| result+= value.terreno }
		return result

	end 	

	def calculoEmisiones(dias)
		return emisiones()*dias
	end

end
