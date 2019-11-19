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
		nodos.each do |nodo|
			self.insert(nodo)
		end
	end
	
	def insert(nodo)
		@size = @size + 1
		if !(nodo.instance_of? Node) then
			nodo = Node.new(nodo,nil,nodoPrev)
		end
		if (@head == nil) then
			@head = nodo
		end
		if(@tail == nil) then
			@tail = nodo
		else
			nodo.prev = @tail
			@tail.next = nodo
			@tail = nodo
		end
	end
	
	def extract_tail()
		nodo = @tail
		@tail = @tail.prev
		@tail.next = nil
		return nodo
	end
	
	def extract_head()
		nodo = @head
		@head = @head.next
		@head.prev = nil
		return nodo
	end
end
#end

