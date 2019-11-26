require 'gema'

class Plato < ListaDobleEnlazada

	attr_reader :nombre, :peso, :totalProteinas, :porcentajeProteinas, :totalCarbohidratos, :porcentajeCarbohidratos, :totalLipidos, :porcentajeLipidos, :totalVCT		

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
	end	
	def insert(value)
		method(:insert).super_method.call(value) #Llama al metodo insert de padre		
		
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
		
	end
	
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
	end 
end
