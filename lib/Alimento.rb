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

	attr_reader :nombre, :proteinas, :carbohidratos, :lipidos, :gei, :terreno
	
	def initialize(nombre,proteinas,carbohidratos,lipidos, gei,terreno)
		@nombre = nombre
		@proteinas = proteinas
		@carbohidratos = carbohidratos
		@lipidos = lipidos
		@gei = gei
		@terreno = terreno
	end
end
