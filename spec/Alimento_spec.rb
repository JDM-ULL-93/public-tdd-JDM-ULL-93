require 'lib/Alimento'

Rspec.describe Alimento do
	before(:all) do
		@alimentoTest = Alimento.new("Lentejas")
	end
	
	context "Probando que los valores seteados se han seteado correctamente" do
		it "Probando que el nombre seteado corresponde con el inscrito" do
			expect(@alimentoTest.nombre).to eq("Lentejas")
		end
		it "Prueba de que los valores de lo macronutrientes corresponden" do
			expect(@alimentoTest.proteinas).to eq(23.5)
			expect(@alimentoTest.carbohidratos).to eq(52.0)
			expect(@alimentoTest.lipidos).to eq(1.4)
		end
		it "Prueba de que el GEI corresponde" do
			expect(@alimentoTest.gei).to eq(0.4)
		end
		it "Prueba de que el terreno usado para producir el alimento corresponde" do
			expect(@alimentoTest.terreno).to eq(3.4)
		end
	end
end
