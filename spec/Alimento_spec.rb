require_relative '../lib/Alimento'

describe Alimento do
	before(:all) do
		@alimentoTest = Alimento.setNombre("Carne de vaca").setProteinas(21.1).setCarboHidratos(0.0).setLipidos(3.1).setGEI(50).setTerreno(164).build()
	end
	
	context "Probando que los valores seteados se han seteado correctamente" do
		it "Prueba que el nombre seteado corresponde" do
			expect(@alimentoTest.nombre).to eq("Carne de vaca")
		end
		it "Prueba de que los valores de lo macronutrientes corresponden" do
			expect(@alimentoTest.proteinas).to eq(21.1)
			expect(@alimentoTest.carbohidratos).to eq(0.0)
			expect(@alimentoTest.lipidos).to eq(3.1)
		end
		it "Prueba de que las emisiones de kg CO^2 corresponde" do
			expect(@alimentoTest.gei).to eq(50)
		end
		it "Prueba de que el terreno usado para producir el alimento corresponde" do
			expect(@alimentoTest.terreno).to eq(164.0)
		end
		it "Prueba de que el terreno utilizado corresponde con los años en producción" do
			expect(@alimentoTest.terrenoUsado(5)).to eq(17.0)
		end
		it "Prueba de que el valor energetico del alimento corresponde" do
			expect(@alimentoTest.valorEnergetico).to eq(TODO)
		end
		it "Prueba de que el impacto medioambiental diario de un hombre  comiendo solo ese alimento corresponde" do
			expect(@alimentoTest.impactoMedioambiental(true)).to eq(TODO)
		end
		it "Prueba de que el impacto medioambiental diario de una mujer comiendo solo ese alimento corresponde" do
			expect(@alimentoTest.impactoMedioambiental(false)).to eq(TODO)
		end
		it "Prueba de que to_s funciona correctamente" do
			expect(@alimentoTest.to_s()).to eq("TODO")
		end
	end
end
