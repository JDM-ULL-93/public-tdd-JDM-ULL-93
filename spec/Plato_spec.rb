require 'gema'

describe Plato do
	before(:all) do
		Plato.setCompareMode(Plato::CompareMode::ByVCT)
		@platoTest = Plato.new("PlatoTest")
		@platoTest.insertList(Alimento.copy(Dieta.alimentos["Carne de vaca"]).setCantidad(0.3),Alimento.copy(Dieta.alimentos["Cerveza"]).setCantidad(0.1), Alimento.copy(Dieta.alimentos["Queso"]).setCantidad(0.2))
		@platoTest2 = Plato.new("Plato dieta Española")
		@platoTest2.insertList(Alimento.copy(Dieta.alimentos["Salmón (piscifactoría)"]).setCantidad(0.2), Alimento.copy(Dieta.alimentos["Huevos"]).setCantidad(0.4))
		@platoTest3 = Plato.new("Plato dieta Vasca")
		@platoTest3.insertList(Alimento.copy(Dieta.alimentos["Salmón (piscifactoría)"]).setCantidad(0.2), Alimento.copy(Dieta.alimentos["Camarones (piscifactoría)"]).setCantidad(0.4))
		@platoTest4 = Plato.new("Plato dieta Vegetaria")
		@platoTest4.insertList(Alimento.copy(Dieta.alimentos["Carne de vaca"]).setCantidad(0.3),Alimento.copy(Dieta.alimentos["Cerveza"]).setCantidad(0.1),Alimento.copy(Dieta.alimentos["Queso"]).setCantidad(0.2),Alimento.copy(Dieta.alimentos["Leche de vaca"]))
		@platoTest5 = Plato.new("Plato dieta Vegetariana")
		@platoTest5.insertList(Alimento.copy(Dieta.alimentos["Queso"]).setCantidad(0.4), Alimento.copy(Dieta.alimentos["Tofu"]).setCantidad(0.5))
		@platoTest6 = Plato.new("Plato dieta Locura Por Carne")
		@platoTest6.insertList(Alimento.copy(Dieta.alimentos["Carne de vaca"]).setCantidad(0.3),Alimento.copy(Dieta.alimentos["Cerveza"]).setCantidad(0.15),Alimento.copy(Dieta.alimentos["Carne de cordero"]).setCantidad(0.26))
		@platoTest7 = Plato.new("PlatoMaxAdHoc")
		@platoTest7.insertList(Alimento.copy(Dieta.alimentos["Carne de vaca"]).setCantidad(10),Alimento.copy(Dieta.alimentos["Cerveza"]).setCantidad(10))
		@listaPlatos = ListaDobleEnlazada.new()
		@listaPlatos.insertList(@platoTest,@platoTest2,@platoTest3,@platoTest4,@platoTest5,@platoTest6,@platoTest7)
	end
	
	context "Probando que las propiedades de la instancia se calculan correctamente y corresponden con lo esperado" do
		it "Probando que el nombre se ha seteado correctamente" do
			expect(@platoTest.nombre).to eq("PlatoTest")
		end
		it "Probando que el total de kilogramos del plato corresponden" do
			expect(@platoTest.peso).to eq(60) #en g
		end
		it "Probando que el total de gramos de carbohidratos del plato corresponden" do
			expect(@platoTest.totalCarbohidratos.round(2)).to eq(0.62) #0.62g no 0.62kg
		end
		it "Probando que el total de gramos de proteinas del plato corresponden" do
			expect(@platoTest.totalProteinas.round(2)).to eq(11.38)
		end
		it "Probando que el total de gramos de lipidos/grasas del plato corresponden" do
			expect(@platoTest.totalLipidos.round(2)).to eq(7.53)
		end
		it "Probando que el porcentaje de carbohidratos corresponde" do
			expect(@platoTest.porcentajeCarbohidratos.round(2)).to eq(3.17)
		end
		it "Probando que el % de proteinas corresponde" do
			expect(@platoTest.porcentajeProteinas.round(2)).to eq(58.27)
		end
		it "Probando que el % de lipídos corresponde" do
			expect(@platoTest.porcentajeLipidos.round(2)).to eq(38.56)
		end
		it "Probando que el valor calórico total(v.c.t) corresponde" do
			expect(@platoTest.totalVCT.round(2)).to eq(115.77)#en kcal
		end
		it "Probando que la huella nutricional media de todos los alimentos del plato corresponde" do
			expect(@platoTest.huellaNutricional).to eq(1)
		end

		it "Probando que la inicialización via DSL funciona correctamente" do
			plato = Plato.new("Plato de prueba DSL") do
				alimento :descripcion => "carne de vaca",
					 :gramos => 100
				alimento :descripcion => "huevo",
					 :gramos => 20
			end
			puts plato
		end
	end

	context "Probando que los metodos de la instancia funciona correctamente" do
		it "Probando que el metodo 'to_s' funciona correctamente" do
			puts @platoTest
		end
	end
	
	context "Probando que la incorporación del modulo 'Comparable' funciona correctamente" do
		it "Probando que se es mayor cuando corresponde" do
			expect(@platoTest2 > @platoTest3).to eq(true)
		end
		it "Probando que se es menor cuando corresponde" do
			expect(@platoTest4 < @platoTest5).to eq(true)
		end
		it "Probando que no es igual cuando corresponde" do
			expect(@platoTest != @platoTest2).to eq(true)
			expect(@platoTest2 == @platoTest).to eq(false)
		end
		it "Probando que se es mayor o igual cuando corresponde" do
			expect(@platoTest6 >= @platoTest3).to eq(true)
		end
		it "Probando que es menor o igual cuando corresponde" do
			expect(@platoTest3 <= @platoTest2).to eq(true)
		end
		it "Probando que la lista de platos se enumeran correctamente" do
			#Ordenado de menor a mayor
			expect(@listaPlatos.sort()).to eq([@platoTest3,@platoTest6,@platoTest2,@platoTest,@platoTest4,@platoTest5,@platoTest7])
		end		
	end

	context "Prueba ad hoc para Practica 9" do
		it "Prueba de que en una lista de platos se devuelve correctamente el de mayor huellaNutricional" do
			Plato.setCompareMode(Plato::CompareMode::ByHuellaNutricional)
			platoMax = @listaPlatos.max()
			expect(platoMax).to eq(@platoTest2)
		end
		it "Prueba ad hoc para practica 9 sobre aumentar una lista de precios en proporcion a la diferencia entre el plato y el plato de mayor huella nutricional" do
			Plato.setCompareMode(Plato::CompareMode::ByHuellaNutricional)
			listaPrecios = [7.5, 5.6, 10.0, 8.6, 9.5, 6.0,15.0]
			platoMax = @listaPlatos.max()
			listaPreciosAct = listaPrecios.each_with_index.collect do |precio,index|
				precio = (platoMax.huellaNutricional/@listaPlatos[index].huellaNutricional) * precio.to_f()
			end
			expect(listaPreciosAct).to eq([15.0,5.6,10.0,17.2,9.5,12.0,30.0])
		end 
	end
end
