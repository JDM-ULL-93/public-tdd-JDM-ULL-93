require 'Dieta'

describe Dieta do

	before(:all) do
		@dietaEspañola = Dieta.new()
		@dietaEspañola.insertList(Alimento.copy(Dieta.alimentos["Chocolate"]).setCantidad(0.473), Alimento.copy(Dieta.alimentos["Lentejas"]).setCantidad(4.5), Alimento.copy(Dieta.alimentos["Nuez"]).setCantidad(2.09))
		
		@dietaVasca = Dieta.new()
		@dietaVasca.insertList(Alimento.copy(Dieta.alimentos["Chocolate"]).setCantidad(2.35),Alimento.copy(Dieta.alimentos["Cerveza"]).setCantidad(47.41),Alimento.copy(Dieta.alimentos["Lentejas"]).setCantidad(3.25))
		
		@dietaVegetaria = Dieta.new()
		@dietaVegetaria.insertList(Alimento.copy(Dieta.alimentos["Chocolate"]).setCantidad(1.9),Alimento.copy(Dieta.alimentos["Leche de vaca"]),Alimento.copy(Dieta.alimentos["Huevos"]), Alimento.copy(Dieta.alimentos["Lentejas"]).setCantidad(3.38),Alimento.copy(Dieta.alimentos["Nuez"]).setCantidad(1.37))

		@dietaVegetariana = Dieta.new()
		@dietaVegetariana.insertList(Alimento.copy(Dieta.alimentos["Huevos"]).setCantidad(4.94),Alimento.copy(Dieta.alimentos["Tofu"]).setCantidad(10.34),Alimento.copy(Dieta.alimentos["Lentejas"]).setCantidad(4.28))
		
		@dietaLocuraCarne = Dieta.new()
		@dietaLocuraCarne.insertList(Alimento.copy(Dieta.alimentos["Camarones (piscifactoría)"]).setCantidad(4.87),Alimento.copy(Dieta.alimentos["Chocolate"]).setCantidad(4.26),Alimento.copy(Dieta.alimentos["Lentejas"]).setCantidad(1.78))
	end
	

	context "Probando que los valores de la clase 'Dieta' corresponden con los esperados" do
		it "Probando que el calculo de las emisiones diarias corresponde" do
			expect(@dietaEspañola.emisiones).to eq(3.5149)
			expect(@dietaVasca.emisiones).to eq(18.0834)
			expect(@dietaVegetaria.emisiones).to eq(13.533)
			expect(@dietaVegetariana.emisiones).to eq(43.14)
			expect(@dietaLocuraCarne.emisiones).to eq(98.17)
		end
		it "Probando que el calculo del terreno usado diario corresponde" do
			expect(@dietaEspañola.terreno).to eq(33.4192)
			expect(@dietaVasca.terreno).to eq(29.4702)
			expect(@dietaVegetaria.terreno).to eq(43.375)
			expect(@dietaVegetariana.terreno).to eq(65.458)
			expect(@dietaLocuraCarne.terreno.round(3)).to eq(30.276)
		end
	end
	context "Probando que los metodos de la clase 'Dieta' funcionan correctamente" do
		it "Probando que el metodo 'calculoEmisiones' funciona correctamente para un año" do
			expect(@dietaEspañola.calculoEmisiones(365)).to eq(1282.9385)
			expect(@dietaVasca.calculoEmisiones(365).round(3)).to eq(6600.441)
			expect(@dietaVegetaria.calculoEmisiones(365)).to eq(4939.545)
			expect(@dietaVegetariana.calculoEmisiones(365)).to eq(15746.1)
			expect(@dietaLocuraCarne.calculoEmisiones(365)).to eq(35832.05)
		end
	end
end
