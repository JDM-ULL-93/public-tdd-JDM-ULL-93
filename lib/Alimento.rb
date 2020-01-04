#Esta clase representa un Alimento y las propiedades de este (nombre,cantidad,proteinas,carbohidratos,lipidos,...)
class Alimento
	@@nombre = ""
	@@proteinas = 0
	@@carbohidratos = 0
	@@lipidos = 0
	@@gei = 0
	@@terreno = 0
	@@cantidad = 1
	class << self
		#Define el parametro 'nombre' de la clase Alimento que el Constructor seteará.
		# @param [Nombre] nombre Nombre del plato.
		def setNombre(nombre)
			@@nombre = nombre
			return self
		end
		#Define el parametro 'proteinas'(en g) de la clase Alimento que el constructor seteará.
		# @param [Proteinas] carbohidratos Cantidad de proteinas, en g, que el alimento otorga.
		def setProteinas(proteinas)
			@@proteinas = proteinas
			return self
		end
		#Define el parametro 'carbohidratos'(en g) de la clase Alimento que el Constructor seteará.
		# @param [Carbohidratos] carbohidratos Cantidad de carbohidratos, en g, que el alimento otorga.
		def setCarbohidratos(carbohidratos)
			@@carbohidratos = carbohidratos
			return self
		end
		#Define el parametro 'lipidos'(en g) de la clase Alimento que el Constructor seteará.
		# @param [Lipidos] lipidos Cantidad de lipidos, en g, que el alimento otorga.
		def setLipidos(lipidos)
			@@lipidos = lipidos
			return self
		end
		#Define el parametro 'gei'(gases de efecto invernadero) de la clase Alimento que el Constructor seteará.
		# @param [Float] gei Gases de Efecto Invernandero, en kgCO2 , que el alimento produce en su producción.
		def setGEI(gei)
			@@gei = gei
			return self
		end
		#Define el parametro 'terreno'(en m^2 necesarios para producir el alimento) de la clase Alimento que el Constructor seteará.
		# @param [Float] terreno Terreno necesario, en m^2, para producir el alimento.
		def setTerreno(terreno)
			@@terreno = terreno
			return self
		end
		#Define el parametro 'peso'(en kg) de la clase Alimento que el Constructor seteará.
		# @param [Float] cantidad Peso del alimento en Kg.
		def setCantidad(cantidad)
			@@cantidad = cantidad
			return self
		end
		#Construye una nueva instancia de la clase Alimento con los atributos seteados previamente(setTerreno,setCantidad,...) y la devuelve.
		def build()
			return Alimento.new(@@nombre,@@proteinas,@@carbohidratos,@@lipidos,@@gei,@@terreno)
		end
		#Construye una lista de instancias de la clase Alimentos de acuerdo al contenido de un fichero.
		#Los parametros se separan por espacios en blanco(\s).
		#Los distintos alimentos se separan por saltos de linea(\n).
		# @param [String] input Contenido del fichero en una cadena.
		def constructListFromFile(input)
			result = Array.new()
			size = input.size/6
			for i in 0..size-1
				alimento = Alimento.new(input[6*i], input[6*i+1].to_f, input[6*i+2].to_f, input[6*i+3].to_f, input[6*i+4].to_f, input[6*i+5].to_f)
				result.append( alimento )
			end
			return result
		end
		#Construye un diccionario de instancias de la clase Alimentos, con key == nombre del alimento de acuerdo al contenido de un fichero.
		#Los parametros se separan por espacios en blanco(\s).
		#Los distintos alimentos se separan por saltos de linea(\n).
		# @param [String] input Contenido del fichero en una cadena.
		def constructHashFromFile(input)
			result = Hash.new()
			size = input.size/6
			for i in 0..size-1
				alimento = Alimento.new(input[6*i], input[6*i+1].to_f, input[6*i+2].to_f, input[6*i+3].to_f, input[6*i+4].to_f, input[6*i+5].to_f)
				result.store(input[6*i] , alimento )
			end
			return result
		end

		#Devuelve una instancia copia de la clase Alimento dado otra instancia de la clase Alimento pasado como parametro.
		# @param [Alimento] copy instancia de la clase Alimento que se desea copiar en otra instancia.
		def copy(copy)
			return Alimento.new(copy.nombre,copy.proteinas,copy.carbohidratos,copy.lipidos,copy.gei,copy.terreno)
		end
	end

	include Comparable
	attr_reader :nombre, :cantidad, :huellaNutricional
#	attr_accessor :cantidad

	#Define la cantidad, en kg, del alimento.
	# @param [Float] cantidad  .
	def setCantidad(cantidad)
	 	@cantidad = cantidad
		return self
	end


	#Recupera la cantidad de proteinas, en g, del alimento (relativo a la cantidad del alimento).
	def proteinas
		return @proteinas*@cantidad
	end
	#Recupera la cantidad de carbohidratos,en g, del alimento (relativo a la cantidad del alimento).
	def carbohidratos
		return @carbohidratos*@cantidad
	end
	#Recupera la cantidad de lipidos,en g, del alimento (relativo a la cantidad del alimento).
	def lipidos
		return @lipidos*@cantidad
	end
	#Recupera la cantidad de gases de efecto invernadero producidos, en KgCO2, en la producción del alimento (relativo a la cantidad del alimento).
	def gei
		return @gei*@cantidad
	end
	#Recupera la cantidad de m^2 de terreno necesario para producir el alimento (relativo a la cantidad del alimento).
	def terreno
		return @terreno*@cantidad
	end
	#Recupera el valor Energetico, en kcal, que produce la ingesta del alimento (relativo a la cantidad del alimento).
	def valorEnergetico
		return @valorEnergetico*@cantidad
	end

	#Constructor de instancias de la clase Alimento.
	# @param [String] nombre.
	# @param [Float] proteinas.
	# @param [Float] carbohidratos.
	# @param [Float] lipidos.
	# @param [Float] gei.
	# @param [Float] terreno.
	def initialize(nombre,proteinas,carbohidratos,lipidos, gei,terreno,cantidad = 1.0)
		@nombre = nombre
		@proteinas = proteinas
		@carbohidratos = carbohidratos
		@lipidos = lipidos
		@gei = gei
		@terreno = terreno

		@valorEnergetico = (@proteinas * 4 ) + (@carbohidratos * 4) + (@lipidos * 9)
		@cantidad = cantidad #En Kg
		impactoEnergia = case @valorEnergetico
			when 0..67 then 1
			when 670..83 then 2
			else 3
		end
		impactoHuellaDeCarbono = case @gei
			when 0..80 then 1
			when 80..120 then 2
			else 3
		end
		@huellaNutricional = (impactoEnergia + impactoHuellaDeCarbono)/2 
	end
	
	#Devuelve la cantidad necesaria, en kg, que hay que ingerir del alimento para ingerir cal_nec kcal y prot_nec g de proteínas.
	# @param [Float] cal_nec Calorías, en kcal, que hay que ingerir.
	# @param [Float] prot_nec Proteinas, en g, que hay que ingerir.
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
	
	#Devuelve un string que es el alimento formateado para ser entendible por un humano.
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
	
	#Metodo que debe ser implementado para que la incorporación del modulo 'Comparable' funcione correctamente de acuerdo a las propiedades del Alimento.
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
