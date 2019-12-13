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
	attr_reader :nombre, :peso, :totalProteinas, :porcentajeProteinas, :totalCarbohidratos, :porcentajeCarbohidratos, :totalLipidos, :porcentajeLipidos, :totalVCT		
	
	#Devuelve la media de las huellasNutricionales de todos los alimentos del plato
	def huellaNutricional()
		return @huellaNutricional/self.size()
	end
	
	def initialize(nombre)
		super()
		@nombre = nombre
		@peso = 0
		@totalProteinas = 0
		@porcentajeProteinas = 0
		@totalCarbohidratos = 0
		@porcentajeCarbohidratos = 0
		@totalLipidos = 0
		@porcentajeLipidos = 0
		@totalVCT = 0
		@huellaNutricional = 0
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

	def to_s
		result = ""
		self.each{|alimento| result += "#{alimento.nombre}(#{alimento.cantidad*100} g), " }
		result = result[0...-2]
		result += ". #{@porcentajeProteinas.round(2)}% Proteinas, #{@porcentajeCarbohidratos.round(2)}% Carbohidratos, #{@porcentajeLipidos.round(2)}% Lipidos, #{@totalVCT.round(2)} kcal"
		return result
	end 
	
	def <=>(other)
		return nil unless other.instance_of? Plato
		if(@@compareMode == CompareMode::ByVCT) then
			@totalVCT  <=> other.totalVCT 
		else
			self.huellaNutricional <=> other.huellaNutricional
		end
	end
end
