require 'gema'

#Esta clase describe una lista de instancias de la clase Alimento
class Plato < ListaDobleEnlazada

	#Enum útil para controlar el comportamiento del metodo '<=>' (necesario para el modulo 'Comparable'). 			
	module CompareMode
		ByVCT = 1 #Comparará platos según su Valor Calorico Total
		ByHuellaNutricional = 2 #Comparará platos según su Huella Nutricional
	end
	#Flag de clase Plato que guarda el modo en el que las comparaciones entre instancias de la clase Plato se han de ejecutar
	@@compareMode = CompareMode::ByVCT
	#Define el modo de la comparación entre 2 instancias de la clase Plato
	# @param [Integer(Enum CompareMode)] mode
	def Plato.setCompareMode(mode)
		@@compareMode = mode
	end

	include Comparable
	attr_reader  :peso, :totalProteinas, :porcentajeProteinas, :totalCarbohidratos, :porcentajeCarbohidratos, :totalLipidos, :porcentajeLipidos, :totalVCT		
	attr_accessor :nombre, :precio	

	#Devuelve la media de las huellasNutricionales de todos los alimentos del plato
	def huellaNutricional()
		return @huellaNutricional/self.size()
	end
	
	def initialize(nombre, &block)
		super()
		#Nombre del plato
		@nombre = nombre
		#Peso (en kg) del plato
		@peso = 0
		#Proteinas (en g) del plato
		@totalProteinas = 0
		#Porcentaje de proteinas respecto al total(carbohidratos + proteinas + lipidos)
		@porcentajeProteinas = 0
		#Carbohidratos (en g) del plato
		@totalCarbohidratos = 0
		#Carbohidratos de proteinas respecto al total(carbohidratos + proteinas + lipidos)
		@porcentajeCarbohidratos = 0
		#Lípidos (en g) del plato
		@totalLipidos = 0
		#Porcentaje de lipidos respecto al total(carbohidratos + proteinas + lipidos)
		@porcentajeLipidos = 0
		#El valor calorico (en kcal) total del plato (de la suma del valor calorico de todos los alimentos del plato)
		@totalVCT = 0
		#Impacto del plato en relación a las kcal y los kgCO2 que emiten los alimentos del plato.
		@huellaNutricional = 0
	
		@precio = 0.0

		if block_given?
			if block.arity == 1
				yield self
			else
				instance_eval(&block)
			end
		end
	end
	
	#Funcion adhoc para soporte DSL
	#Formato:
	#  { :descripcion => <"Nombre alimento">, :proteinas => X, :carbohidratos => Y, :lipidos => Z, :gei => A, :terreno => B, :gramos => C }
	def alimento(options = {} )
		nombre = options[:descripcion] ? "#{options[:descripcion]}" : 'Sin nombre'
		proteinas = options[:proteinas] ? options[:proteinas] : 0.1
		carbohidratos = options[:carbohidratos] ? options[:carbohidratos] : 0.1
		lipidos = options[:lipidos] ? options[:lipidos] : 0.1
		gei = options[:gei] ? options[:gei] : 0.1
		terreno = options[:terreno] ? options[:terreno] : 0.1
		cantidad = options[:gramos] ? options[:gramos].to_f/1000.0 : 1
		 		
		result = Alimento.new(nombre,proteinas,carbohidratos,lipidos,gei,terreno,cantidad)
		self.insert(result)
	end
	
	#Define el comportamiento de la clase Plato en el momento en el que un nuevo alimento es insertado
	#Sobreescribe el metodo 'inserted(value)' definido en la clase padre 'ListaDobleEnlazada' y es
	# llamado inertamente cada vez que se llama al metodo 'insert' en clase padre 'ListaDobleEnlazada'
	# @param [Alimento] value El alimento que acaba de ser insertado
	def inserted(value)
		#method(:insert).super_method.call(value) #Llama al metodo insert de padre		
		
		alimento = value
		if( value.instance_of? Node) then alimento = value.value end
			@peso += alimento.cantidad*100 #Representado en g
			@totalProteinas += alimento.proteinas
			@totalCarbohidratos += alimento.carbohidratos
			@totalLipidos += alimento.lipidos
			@totalVCT += alimento.valorEnergetico
			totalNutrientes = @totalProteinas + @totalCarbohidratos + @totalLipidos 
			@porcentajeProteinas = @totalProteinas / totalNutrientes * 100
			@porcentajeCarbohidratos = @totalCarbohidratos / totalNutrientes * 100
			@porcentajeLipidos = @totalLipidos / totalNutrientes * 100
			@huellaNutricional += alimento.huellaNutricional
		
	end
	
	#Define el comportamiento de la clase Plato en el momento en el que un alimento es eliminado de su lista inserta
	#Sobreescribe el metodo 'extracted(nodo)' definido en la clase padre 'ListaDobleEnlazada' y es
	# llamado internamente cada vez que se llama al metodo 'delete' en clase padre 'ListaDobleEnlazada'
	# @param [Alimento] nodo El alimento que acaba de ser eliminado de la lista
	def extracted(nodo)
		alimento = nodo
		if( value.instance_of? Node) then alimento = value.value end
			@peso -= alimento.cantidad*100 #Representado en g
			@totalProteinas -= alimento.proteinas
			@totalCarbohidratos -= alimento.carbohidratos
			@totalLipidos -= alimento.lipidos
			@totalVCT -= alimento.valorEnergetico
			totalNutrientes = @totalProteinas + @totalCarbohidratos + @totalLipidos 
			@porcentajeProteinas = @totalProteinas / totalNutrientes * 100
			@porcentajeCarbohidratos = @totalCarbohidratos / totalNutrientes * 100
			@porcentajeLipidos = @totalLipidos / totalNutrientes * 100
			@huellaNutricional -= alimento.huellaNutricional
	end
	
	#Devuelve el objeto Plato formateado en un string endentible para un ser humano
	def to_s
		
		result = "#{self.nombre} : "
		self.each{|alimento| result += "#{alimento.nombre}(#{alimento.cantidad*1000} g), " } if self.size > 0
		result = result[0...-2]
		result += ". #{@porcentajeProteinas.round(2)}% Proteinas, #{@porcentajeCarbohidratos.round(2)}% Carbohidratos, #{@porcentajeLipidos.round(2)}% Lipidos, #{@totalVCT.round(2)} kcal"
		return result
	end 
	
	#Implementación del metodo 'Comparable::<=>' para implementación con clase Plato
	def <=>(other)
		return nil unless other.instance_of? Plato
		if(@@compareMode == CompareMode::ByVCT) then
			@totalVCT  <=> other.totalVCT 
		else
			self.huellaNutricional <=> other.huellaNutricional
		end
	end
end
