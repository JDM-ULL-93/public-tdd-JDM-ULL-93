class Alimento
	@@nombre = ""
	@@proteinas = 0
	@@carbohidratos = 0
	@@lipidos = 0
	@@gei = 0
	@@terreno = 0
	@@cantidad = 1
	class << self
		def setNombre(nombre)
			@@nombre = nombre
			return self
		end

		def setProteinas(proteinas)
			@@proteinas = proteinas
			return self
		end
		
		def setCarbohidratos(carboHidratos)
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
		def setCantidad(cantidad)
			@@cantidad = cantidad
			return self
		end
		def build()
			return Alimento.new(@@nombre,@@proteinas,@@carbohidratos,@@lipidos,@@gei,@@terreno)
		end
		
		def constructListFromFile(input)
			result = Array.new()
			size = input.size/6
			for i in 0..size-1
				alimento = Alimento.new(input[6*i], input[6*i+1].to_f, input[6*i+2].to_f, input[6*i+3].to_f, input[6*i+4].to_f, input[6*i+5].to_f)
				result.append( alimento )
			end
			return result
		end

		def constructHashFromFile(input)
			result = Hash.new()
			size = input.size/6
			for i in 0..size-1
				alimento = Alimento.new(input[6*i], input[6*i+1].to_f, input[6*i+2].to_f, input[6*i+3].to_f, input[6*i+4].to_f, input[6*i+5].to_f)
				result.store(input[6*i] , alimento )
			end
			return result
		end

		def copy(copy)
			return Alimento.new(copy.nombre,copy.proteinas,copy.carbohidratos,copy.lipidos,copy.gei,copy.terreno)
		end
	end

	include Comparable
	attr_reader :nombre, :cantidad
#	attr_accessor :cantidad

	def setCantidad(cantidad)
	 	@cantidad = cantidad
		return self
	end

	def proteinas
		return @proteinas*@cantidad
	end
	def carbohidratos
		return @carbohidratos*@cantidad
	end
	def lipidos
		return @lipidos*@cantidad
	end
	def gei
		return @gei*@cantidad
	end
	def terreno
		return @terreno*@cantidad
	end
	def valorEnergetico
		return @valorEnergetico*@cantidad
	end

	def initialize(nombre,proteinas,carbohidratos,lipidos, gei,terreno)
		@nombre = nombre
		@proteinas = proteinas
		@carbohidratos = carbohidratos
		@lipidos = lipidos
		@gei = gei
		@terreno = terreno

		@valorEnergetico = (@proteinas * 4 ) + (@carbohidratos * 4) + (@lipidos * 9)
		@cantidad = 1.0 #En Kg
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
		return "[Nombre:#{@nombre}, Peso:#{@cantidad} kg, Proteinas:#{proteinas.round(2)} g, Carbohidratos:#{carbohidratos.round(2)} g, Lipidos:#{lipidos.round(2)} g, Valor Energetico:#{valorEnergetico.round(2)} kcal, Emisiones: #{gei.round(2)} kgCO2, Terreno Usado:#{terreno.round(2)} m^2]"  
	end
		
#	def terrenoUsado(kg)
#		return @terreno*kg
#	end

#	def impactoAmbiental(kg)
#		return @gei*kg
#	end 
#require 'pry'
	def <=>(other)
#		binding.pry
		return nil unless other.instance_of? Alimento
		valorEnergetico  <=> other.valorEnergetico
	end
	
#	def ==(other)
#		return false unless other.instance_of? Alimento
#		return true if (@valorEnergetico == other.valorEnergetico && @proteinas == other.proteinas)
#		return false
#	end
	
#	def +(other)
#		return nil unless other.instance_of? Alimento
#		return Alimento.new("#{@nombre} y #{other.nombre}",@proteinas + other.proteinas, @carbohidratos + other.carbohidratos, @lipidos + other.lipidos, @gei + other.gei, @terreno + other.terreno)
#	end
end
