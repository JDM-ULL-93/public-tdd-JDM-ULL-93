require 'gema/ListaDobleEnlazada'

describe ListaDobleEnlazada do
	before(:all) do
		@listaEnlazadaTest = ListaDobleEnlazada.new()
		@nodo1Test = Node.new("Dato1")
		@nodo2Test = Node.new("Dato2")
		@nodo3Test = Node.new("Dato3")
		@listaEnlazadaTest.insertList(@nodo1Test,@nodo2Test)
		expect(@listaEnlazadaTest.head.prev).to eq(nil)
		expect(@listaEnlazadaTest.tail.next).to eq(nil)
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
		it "Prueba de que se han seteado los atributos prev y next correctamente para 'Nodo1'" do
			expect(@nodo1Test.prev).to eq(nil)
			expect(@nodo1Test.next).to eq(@nodo2Test)
		end
		it "Prueba de que se han seteado los atributos prev y next correctamente para 'Nodo2'" do
			expect(@nodo2Test.prev).to eq(@nodo1Test)
			expect(@nodo2Test.next).to eq(nil)
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
		it "Prueba de que se controla bien la inserción de elementos que no son nodos" do
			@listaEnlazadaTest.insert("Dato4")
			expect(@listaEnlazadaTest.tail.value).to eq("Dato4")
		end
		it "Prueba  de que se controla bien la inserción de una lista de elementos que no son nodos" do
			@listaEnlazadaTest.insertList("Dato5","Dato6","Dato7")
			expect(@listaEnlazadaTest.tail.value).to eq("Dato7")
			expect(@listaEnlazadaTest.tail.prev.value).to eq("Dato6")
		end
		
	end
end
