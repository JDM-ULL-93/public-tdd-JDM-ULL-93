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
			expect(@alimentoTest.valorEnergetico.round(1)).to eq(1123.0/10.0)
		end
	end

	context "Probando que los metodos funcionan correctamente" do
		it "Prueba de que la cantidad de kg de dicho alimento a comer para la ingesta recomendada de un hombre corresponde" do
			expect(@alimentoTest.cantidadNecesaria(3000,54).round(2)).to eq(26.71)
		end
		it "Prueba de que la cantidad de kg de dicho alimento a comer para la ingesta recomendada de una mujer corresponde" do
			expect(@alimentoTest.cantidadNecesaria(2300,41).round(2)).to eq(20.48)
		end
		it "Prueba de que el metodo para formatear el alimento funciona correctamente" do
			expect(@alimentoTest.to_s()).to eq("Nombre \t Proteinas \t Carbohidratos \t Lipidos \t GEI \t Terreno \n Carne de Vaca \t 21.1 \t 0.0 \t 3.1 \t 50.0 \t 164.0 ")	
		end
	end
end
