require 'gema'

class Menu < ListaDobleEnlazada

	attr_accessor :precio
	attr_reader :nombre, :descripcion

	def initialize(nombre, &block)
		@nombre = nombre
		@descripcion = ""
		@precio = 0.0
	
		super()

		if block_given?
			if block.arity == 1
				yield self
			else
				instance_eval(&block)
			end
		end
	end
	
	#Función de llamada para DSL
	#Formato:
	# {
	#	:descripcion => <"Descripcion del plato">,
	#	:precio => <"Precio total del plato">
	#	:alimento => 	[
	#				{ :descripcion => <"Nombre alimento">, :proteinas => X, :carbohidratos => Y, :lipidos => Z, :gei => A, :terreno => B, :gramos => C}
	#				{ :descripcion => <"Nombre alimento">, :proteinas => X, :carbohidratos => Y, :lipidos => Z, :gei => A, :terreno => B, :gramos => C } 
	#				.
	#				.
	#				.
	#			]
	# }
	def componente( options = {} )
		descripcion =  options[:descripcion]
		plato = Plato.new( descripcion )
		plato.precio = options[:precio] ? options[:precio] : 0
		options[:alimento].each{ |alimento| plato.alimento(alimento) }  if options[:alimento]
		self.insert(plato)
	end

	def descripcion(desc)
		@descripcion = desc
	end

	def precio(precio)
		@precio = precio
	end

	def to_s
		result = "Menu '#{nombre} -> "
		self.each{|plato| result += "#{plato}(#{plato.precio} €)\n, " }
		result = result[0...-2]
		result += ". Precio total = #{@precio} €" 
                return result		
	end
end

