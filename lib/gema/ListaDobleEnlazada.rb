#module Gema
Node = Struct.new(:value, :next, :prev)

class ListaDobleEnlazada

	attr_reader :size, :head, :tail
 
	def initialize()
		@size = 0
		@head = nil
		@tail = nil
	end
	
	def insertList(*nodos)
		nodoPrev = nil
		nodos.each do |nodo|
			@size = @size + 1
			if !(nodo.instance_of? Node) then
				nodo = Node.new(nodo,nil,nodoPrev)
			end
			if (nodoPrev != nil) then
				nodoPrev.next = nodo
			else
				@head = nodo
			end
			nodo.prev = nodoPrev
			nodoPrev = nodo
		end
		@tail = nodoPrev
	end
end
#end

