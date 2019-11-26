require 'gema'

class PlatoEficienciaEnergetica < Plato
	
	attr_reader :totalEmisiones, :totalTerreno
	
	def initialize(nombre)
		super(nombre)
		@totalEmisiones = 0
		@totalTerreno = 0
	end

	def inserted(value)
		method(:inserted).super_method.call(value) #Llama al metodo insert de padre
		alimento = value
		if(value.instance_of? Node) then alimento = value.value end
			@totalEmisiones += alimento.gei
			@totalTerreno += alimento.terreno
	end

	def extracted(value)
		method(:extracted).super_method.call(value) #Llama al metodo insert de padre
		alimento = value
		if(value.instance_of? Node) then alimento = value.value end
			@totalEmisiones -= alimento.gei
			@totalTerreno -= alimento.terreno
	end

	def to_s
		return method(:to_s).super_method.call + " .#{@totalEmisiones} kgCO2, #{@totalTerreno} m^2"
	end
end
