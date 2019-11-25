require 'gema/ListaDobleEnlazada'

describe ListaDobleEnlazada do
	before(:all) do
		@listaEnlazadaTest = ListaDobleEnlazada.new()
		@nodo1Test = Node.new("Dato1")
		@nodo2Test = Node.new("Dato2")
		@nodo3Test = Node.new("Dato3")
		@listaEnlazadaTest.insertList(@nodo1Test,@nodo2Test)
		expect(@listaEnlazadaTest.head.prev).to eq(nil)
		expect(@listaEnlazadaTest.head.next).to eq(@listaEnlazadaTest.tail)
		expect(@listaEnlazadaTest.tail.prev).to eq(@listaEnlazadaTest.head)
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

	context "Probando que los metodos funcionan" do
		it "Prueba de que 'to_s' funciona" do
			expect(@listaEnlazadaTest.to_s()).to eq("-> Dato1 <-> Dato2 <-")
		end
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
			expect(@listaEnlazadaTest.tail.prev).to eq(@nodo2Test)
		end
		it "Prueba  de que se controla bien la inserción de una lista de elementos que no son nodos" do
			@listaEnlazadaTest.insertList("Dato5","Dato6","Dato7")
			expect(@listaEnlazadaTest.tail.value).to eq("Dato7")
			expect(@listaEnlazadaTest.tail.prev.value).to eq("Dato6")
			expect(@listaEnlazadaTest.tail.prev.prev.value).to eq("Dato5")
		end
	end

	context "Probando que la inserción del moodulo 'Enumerable' funciona correctamente" do
				
	end
end
