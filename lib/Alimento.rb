class Alimento

	@@nombre = ""
	@@proteinas = 0
	@@carbohidratos = 0
	@@lipidos = 0
	@@gei = 0
	@@terreno = 0
	class << self
		def setNombre(nombre)
			@@nombre = nombre
			return self
		end

		def setProteinas(proteinas)
			@@proteinas = proteinas
			return self
		end
		
		def setCarboHidratos(carboHidratos)
			@@carbohidratos = carboHidratos
			return self
		end
		
		def setLipidos(lipidos)
			@@lipidos = lipidos
			return self
		end
		
		def setGEI(gei)
			@@gei = gei
			return self
		end

		def setTerreno(terreno)
			@@terreno = terreno
			return self
		end

		def build()
			return Alimento.new(@@nombre,@@proteinas,@@carbohidratos,@@lipidos,@@gei,@@terreno)
		end
	end

	attr_reader :nombre, :proteinas, :carbohidratos, :lipidos, :gei, :terreno, :valorEnergetico
	
	def initialize(nombre,proteinas,carbohidratos,lipidos, gei,terreno)
		@nombre = nombre
		@proteinas = proteinas
		@carbohidratos = carbohidratos
		@lipidos = lipidos
		@gei = gei
		@terreno = terreno

		@valorEnergetico = (@proteinas * 4 ) + (@carbohidratos * 4) + (@lipidos * 9)
	end
	
	def cantidadNecesaria(cal_nec, prot_nec)
		#Los datos del alimento se corresponden a los nutrientes para 1 kg de dicho alimento
		#Entonces, dado que primero debemos satisfacer las proteinas necesarias:
		kg_a_consumir_para_prot_nec = prot_nec / @proteinas.to_f()
		#Tenemos los kg, esos kg consumidos tambien otorgan calorias,asi que restamos a las calorias necesarias:
		cal_rest = cal_nec - (kg_a_consumir_para_prot_nec * @valorEnergetico) #kcal = kcal - (kg * kcal/kg)
		#Ahora, calculamos los kg necesarios para consumir las cal_rest
		kg_a_consumir = cal_rest / @valorEnergetico.to_f() # kg = kcal / (kcal/kg)
		#Sumamos kg_a_consumir para las caloreias, y kg_a_consumir_para_prot_nec para el minimo proteinas necesarioas
		kg_nec = kg_a_consumir + kg_a_consumir_para_prot_nec
		return kg_nec
	end

	def to_s
		return "Nombre \t Proteinas \t Carbohidratos \t Lipidos \t GEI \t Terreno \n #{@nombre} \t #{@proteinas} \t #{@carbohidratos} \t #{@lipidos} \t #{@gei} \t #{@terreno}"  
	end 
end
