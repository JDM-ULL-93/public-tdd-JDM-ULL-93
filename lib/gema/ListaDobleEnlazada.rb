#module Gema
Node = Struct.new(:value, :next, :prev)

class ListaDobleEnlazada
	include Enumerable
	attr_reader :size, :head, :tail
 
	def initialize()
		@size = 0
		@head = nil
		@tail = nil
	end
	
	#Metodo usado para insertar una lista de elementos en el objeto listaDobleEnlazada
	# @param [List] nodos Lista de elementos a insertar
	def insertList(*nodos)
		nodos.each do |nodo|
			self.insert(nodo)
		end
	end
	
	#Inserta un elemento en la lista del objeto listaDobleEnlazada
	# @param [Object] nodo Elemento a insertar
	def insert(nodo)
		@size = @size + 1
		if !(nodo.instance_of? Node) then
			nodo = Node.new(nodo,nil,nil)
		end
		if (@head == nil) then
			@head = nodo
		end
		if(@tail == nil) then
			@tail = nodo
		else
			@tail.next = nodo
			nodo.prev = @tail
			@tail = nodo
		end
		inserted(nodo)
	end

	#PlaceHolder de metodo-evento para ser sobreescrito en clases hijas
	#Este metodo se llama cada vez que un elemento es insertado con exito
	# @param [Object] nodo Elemento insertado
	def inserted(nodo)
	end
	
	#Retorna la cola de la lista del objeto ListaDobleEnlazada y la elimina de esta.
	def extract_tail()
		nodo = @tail
		@tail = @tail.prev
		@tail.next = nil
		extracted(nodo)
		return nodo
	end
	
	#Retorna la cabeza de la lista del objeto ListaDobleEnlazada y la elimina de esta.
	def extract_head()
		nodo = @head
		@head = @head.next
		@head.prev = nil
		extracted(nodo)
		return nodo
	end
	
	#Placeholder de metodo-evento para ser sobreescrito en clases hijas
	#Este metodo se llama cada vez que un elemento es extraido con exito
	# param [Object] nodo Elemento extraido
	def extracted(nodo)
	end

	def to_s()
		result = ""
		self.each{|value| result += "-> " + value.to_s() + " <" }
		result += '-'
		return result
	end

	#Metodo de 'Enumerable' implementado para que sea capaz de trabajar con objetos de tipo LsitaDobleEnlazada
	# @param [Clausure] Bloque_Aridad1 Recibe un bloque que espera como argumento cada elemento de la lista
	def each
		nodo = @head
		loop do
			yield nodo.value
			nodo = nodo.next
			break if(nodo == nil)
		end
	end

	#Retorna el valor situado en la posición <index> del objeto tipo ListaDobleEnlazada
	# @param [Integer] index Indice de la posición del elemento que queremos recoger	
	def [](index)
		result = nil
		count = 0
		return self.each_with_index do |value,index_r|
			if(index_r == index) then	
				return value
			 end	
		end
	end	
end
#end

