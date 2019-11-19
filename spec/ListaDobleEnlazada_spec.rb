require 'ListaDobleEnlazada'

describe ListaDobleEnlazada do
	before(:all) do
		@listaEnlazadaTest = ListaDobleEnlazada.new()
		@nodo1Test = Node.new("Dato1")
		@nodo2Test = Node.new("Dato2")
		@nodo3Test = Node.new("Dato3")
		@listaEnlazadaTest.insertList(@nodo1Test,@nodo2Test)
	end

	context "Probando que los nodos que corresponden al 'HEAD' y al 'TAIL' y el número elementos en lista corresponde" do
		it "Prueba de que la cabecera corresponde con en Nodo1" do
			expect(@listaEnlazadaTest.head).to eq(@nodo1Test)
		end
		it "Prueba de que la cola corresponde con el Nodo2" do
			expect(@listaEnlazadaTest.tail).to eq(@nodo2Test)
		end
		it "Prueba de que el número de elementos en lista corresponde" do
			expect(@listaEnlazadaTest.size).to eq(2)
		end
	end

	context "Probando que los metodos 'insert','extract_head','extract_tail', funcionan" do
		it "Prueba de que se 'insert' funciona" do
			@listaEnlazadaTest.insert(@nodo3Test)
			expect(@listaEnlazadaTest.tail).to eq(@nodo3Test)
		end
		it "Prueba de que 'extract_tail' funciona" do
			nodo = @listaEnlazadaTest.extract_tail()
			expect(nodo).to eq(@nodo3Test)
			expect(@listaEnlazadaTest.tail).to eq(@nodo2Test)
		end
		it "Prueba de que 'extract_head' funciona" do
			nodo = @listaEnlazadaTest.extract_head()
			expect(nodo).to eq(@nodo1Test)
			expect(@listaEnlazadaTest.head).to eq(@listaEnlazadaTest.tail)
		end
		
	end
	context "Cualquier cosa" do
	end
end
