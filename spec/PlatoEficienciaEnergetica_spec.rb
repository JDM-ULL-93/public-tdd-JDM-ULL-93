require 'PlatoEficienciaEnergetica'

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
		end
	end
	
end
