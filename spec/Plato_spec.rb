require 'Plato'
require 'Dieta'

describe Plato do
	before(:all) do
		@platoTest = Plato.new("PlatoTest")
		@platoTest.insertList(Alimento.copy(Dieta.alimentos["Carne de vaca"]).setCantidad(0.3),Alimento.copy(Dieta.alimentos["Cerveza"]).setCantidad(0.1),Alimento.copy(Dieta.alimentos["Queso"]).setCantidad(0.2))
	end
	
	context "Probando que las propiedades de la instancia se calculan correctamente y corresponden con lo esperado" do
		it "Probando que el nombre se ha seteado correctamente" do
			expect(@platoTest.nombre).to eq("PlatoTest")
		end
		it "Probando que el total de kilogramos del plato corresponden" do
			expect(@platoTest.peso).to eq(0.6) #en kg
		end
		it "Probando que el total de gramos de carbohidratos del plato corresponden" do
			expect(@platoTest.totalCarbohidratos).to eq(0.62) #0.62g no 0.62kg
		end
		it "Probando que el total de gramos de proteinas del plato corresponden" do
			expect(@platoTest.totalProteinas).to eq(11.38)
		end
		it "Probando que el total de gramos de lipidos/grasas del plato corresponden" do
			expect(@platoTest.totalLipidos).to eq(7.53)
		end
		it "Probando que el porcentaje de carbohidratos corresponde" do
			expect(@platoTest.porcentajeCarbohidratos.round(2)).to eq(3.18)
		end
		it "Probando que el % de proteinas corresponde" do
			expect(@platoTest.porcentajeProteinas.round(2)).to eq(58.27)
		end
		it "Probando que el % de lipídos corresponde" do
			expect(@platoTest.porcentajeLipidos.round(2)).to eq(38.56)
		end
		it "Probando que el valor calórico total(v.c.t) corresponde" do
			expect(@platoTest.vct).to eq(115.77)#en kcal
		end
	end

	context "Probando que los metodos de la instancia funciona correctamente" do
#		it "Probando que el metodo 'to_s' funciona correctamente" do
#			expect(@platoTest.to_s()).to eq("PlatoTest: -")
#		end
	end
end
