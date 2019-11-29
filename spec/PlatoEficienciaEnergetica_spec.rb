require 'PlatoEficienciaEnergetica'
require 'pry'

describe PlatoEficienciaEnergetica do
	before(:all) do
		@platoTest = PlatoEficienciaEnergetica.new("PlatoTest")		
		@platoTest.insertList(Alimento.copy(Dieta.alimentos["Carne de vaca"]).setCantidad(0.3),Alimento.copy(Dieta.alimentos["Cerveza"]).setCantidad(0.1),Alimento.copy(Dieta.alimentos["Queso"]).setCantidad(0.2))
	end
	
	context "Probando que las propiedades de la instancia se calculan correctamente y corresponden con lo esperado" do
		it "Probando que el total de emisiones para producir el plato corresponde" do
			expect(@platoTest.totalEmisiones.round(3)).to eq(17.224)
		end
		it "Probando que el total de terreno estimado usado corresponde" do
			expect(@platoTest.totalTerreno.round(3)).to eq(57.422)
		end
	end

	context "Probando que los metodos de la instancia funcionan correctamente" do
		it "Probando que el metodo 'to_s' funciona" do
			puts @platoTest
#			binding.pry
		end
	end

	context "Probando que la clase del objeto,el tipo del objeto y su jerarquia corresponde(prueba adhoc pra Practica 8)" do
		it "Probando que la clase del objeto corresponde" do
			expect(@platoTest.class).to eq(PlatoEficienciaEnergetica)			
		end
		it "Probando que el tipo del objeto corresponde" do
			expect(@platoTest.instance_of?PlatoEficienciaEnergetica).to eq(true)
			expect(@platoTest.kind_of?Plato).to eq(true)			
		end
		it "Probando que la jerarquia corresponde(la clase es hija de Plato)" do
			expect(@platoTest.class.superclass).to eq(Plato)
			expect(@platoTest.class.superclass.superclass).to eq(ListaDobleEnlazada)
		end
	end
		
	context "Probando que el modulo 'Enumerable' ha sido incorporado de forma exitosa a la clase" do
		it "Probando que el metodo 'collect' funciona correctamente" do
			expect(@platoTest.collect{|alimento| alimento.nombre}).to eq(["Carne de vaca","Cerveza","Queso"])
		end
		it "Probando que el metodo 'select' funciona correctamente" do
			expect(@platoTest.select{|alimento| alimento.nombre == "Cerveza"}).to eq([@platoTest.tail.prev.value])
		end
		it "Probando que el metodo 'min' funciona correctamente" do
			expect(@platoTest.min()).to eq(@platoTest.head.next.value)
		end
		it "Probando que el metodo 'max' funciona correctamente" do
			expect(@platoTest.max()).to eq(@platoTest.tail.value)
		end
		it "Probando que el metodo 'sort' funciona correctamente" do
			expect(@platoTest.sort()).to eq([@platoTest.head.next.value,@platoTest.head.value, @platoTest.tail.value])
		end
	end
	
end
