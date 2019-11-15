require_relative '../lib/Alimento'

describe Alimento do
	before(:all) do
		@alimentoTest = Alimento.setNombre("Carne de vaca").setProteinas(21.1).setCarbohidratos(0.0).setLipidos(3.1).setGEI(50.0).setTerreno(164.0).build()
		@alimentoTest2 = Alimento.setNombre("Nuez").setProteinas(20.0).setCarbohidratos(21.0).setLipidos(54.0).setGEI(0.3).setTerreno(7.9).build()
		@alimentoTest3 = Alimento.setNombre("Cualquier Cosa").setProteinas(21.1).setCarbohidratos(4.0).setLipidos(119.0/90.0).setGEI(50.0).setTerreno(164.0).build()
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
		it "Prueba de que el valor energetico del alimento corresponde" do
			expect(@alimentoTest.valorEnergetico.round(1)).to eq(1123.0/10.0)
		end
	end

	context "Probando que los metodos funcionan correctamente" do
		it "Prueba de que la cantidad de kg de dicho alimento a comer para la ingesta recomendada de un hombre corresponde" do
			kg_nec = @alimentoTest.cantidadNecesaria(3000,54)
			expect(kg_nec.round(2)).to eq(26.71)
			#La cantidad necesaría final multiplicado por el valorEnergetico debe devolver el mismo numero de kcal solicitado
			#expect(kg_nec*@alimentoTest.valorEnergetico).to eq(3000)
		end
		it "Prueba de que la cantidad de kg de dicho alimento a comer para la ingesta recomendada de una mujer corresponde" do
			kg_nec = @alimentoTest.cantidadNecesaria(2300,41)
			expect(kg_nec.round(2)).to eq(20.48)
			#La cantidad necesaría final multiplicado por el valorEnergetico debe devolver el mismo numero de kcal solicitado
			#expect(kg_nec*@alimentoTest.valorEnergetico).to eq(2300)
		end
		it "Prueba de que el metodo para formatear el alimento funciona correctamente" do
			expect(@alimentoTest.to_s()).to eq("Nombre \t\t Proteinas \t Carbohidratos \t Lipidos \t Valor Energetico \t GEI \t Terreno \n Carne de vaca \t 21.1 \t\t 0.0 \t\t 3.1 \t\t 112.3 \t\t\t 50.0 \t 164.0")	
		end
		it "Prueba de que el terreno utilizado para los kg necesario para un hombre corresponde" do
			expect(@alimentoTest.terrenoUsado(26.71).round(2)).to eq(4380.44)
		end
		it "Prueba de que el impacto medio ambiental para un hombre de entre 20-39 años corresponde" do
			expect(@alimentoTest.impactoAmbiental(26.71).round(2)).to eq(1335.5)
		end
		it "Prueba de que el impacto medio ambiental para una mujer de entre 20-39 años corresponde" do
			expect(@alimentoTest.impactoAmbiental(20.48).round(2)).to eq(1024.0)
		end
		it "Prueba de que la suma de 2 alimentos da otro alimento con la suma de todas sus propiedades" do
			alimentoSuma = @alimentoTest + @alimentoTest2
			expect(@alimentoSuma.nombre).to eq("Carne de vaca y Nuez")
			expect(@alimentoSuma.proteinas).to eq(@alimentoTest.proteinas+alimentoTest2.proteinas)
		end 
	end

	context "Probando que la incoporación del modulo 'Comparable' funciona correctamente" do
		it "Prueba de que se compara correctamente 2 alimentos por su valor energetico" do
			expect(@alimentoTest > @alimentoTest2).to eq(false)
		end
		it "Prueba de que se comprueba que 2 alimentos son iguales o no dependiendo de su valor energetico y las proteinas que otorga" do
			expect(@alimentoTest == @alimentoTest2).to eq(false)
			expect(@alimentoTest == @alimentoTest3).to eq(true)
		end		
	end
end
