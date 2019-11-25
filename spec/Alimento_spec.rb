require 'Alimento'

describe Alimento do
	before(:all) do
		@alimentoTest = Alimento.setNombre("Carne de vaca").setProteinas(21.1).setCarbohidratos(0.0).setLipidos(3.1).setGEI(50.0).setTerreno(164.0).setCantidad(1).build()
		@alimentoTest2 = Alimento.setNombre("Nuez").setProteinas(20.0).setCarbohidratos(21.0).setLipidos(54.0).setGEI(0.3).setTerreno(7.9).setCantidad(1).build()
		@alimentoTest3 = Alimento.setNombre("Cualquier Cosa").setProteinas(21.1).setCarbohidratos(4.0).setLipidos(119.0/90.0).setGEI(50.0).setTerreno(164.0).setCantidad(1).build()
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
		it "Prueba de que 'constructListFromFile' funciona correctamente" do
			result = Alimento.constructListFromFile(%W{Carne\sde\svaca 21.1 0.0 3.1 50.0 164.0 Carne\sde\scordero 18.0 0.0 17.0 20.0 185.0 Camarones\s(piscifactoría) 17.6 1.5 0.6 18.0 2.0 Chocolate 5.3 47.0 30.0 2.3 3.4 Salmón\s(piscifactoría) 19.9 0.0 13.6 6.0 3.7 Cerdo 21.5 0.0 6.3 7.6 11.0 Pollo 20.6 0.0 5.6 5.7 7.1 Queso 25.0 1.3 33.0 11.0 41.0 Cerveza 0.5 3.6 0.0 0.24 0.22 Leche\sde\svaca 3.3 4.8 3.2 3.2 8.9 Huevos 13.0 1.1 11.0 4.2 5.7 Café 0.1 0.0 0.0 0.4 0.3 Tofu 8.0 1.9 4.8 2.0 2.2 Lentejas 23.5 52.0 1.4 0.4 3.4 Nuez 20.0 21.0 54.0 0.3 7.9})
			expect(result[0].nombre).to eq("Carne de vaca")
			expect(result[result.size()-1].nombre).to eq("Nuez")
		end
		it "Prueba de que 'constructHashFromFile' funciona correctamente" do
			result = Alimento.constructHashFromFile(%W{Carne\sde\svaca 21.1 0.0 3.1 50.0 164.0 Carne\sde\scordero 18.0 0.0 17.0 20.0 185.0 Camarones\s(piscifactoría) 17.6 1.5 0.6 18.0 2.0 Chocolate 5.3 47.0 30.0 2.3 3.4 Salmón\s(piscifactoría) 19.9 0.0 13.6 6.0 3.7 Cerdo 21.5 0.0 6.3 7.6 11.0 Pollo 20.6 0.0 5.6 5.7 7.1 Queso 25.0 1.3 33.0 11.0 41.0 Cerveza 0.5 3.6 0.0 0.24 0.22 Leche\sde\svaca 3.3 4.8 3.2 3.2 8.9 Huevos 13.0 1.1 11.0 4.2 5.7 Café 0.1 0.0 0.0 0.4 0.3 Tofu 8.0 1.9 4.8 2.0 2.2 Lentejas 23.5 52.0 1.4 0.4 3.4 Nuez 20.0 21.0 54.0 0.3 7.9})
			expect(result["Carne de vaca"].nombre).to eq("Carne de vaca")
			expect(result["Nuez"].nombre).to eq("Nuez")
		end
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
#		it "Prueba de que el terreno utilizado para los kg necesario para un hombre corresponde" do
#			expect(@alimentoTest.terrenoUsado(26.71).round(2)).to eq(4380.44)
#		end
#		it "Prueba de que el impacto medio ambiental para un hombre de entre 20-39 años corresponde" do
#			expect(@alimentoTest.impactoAmbiental(26.71).round(2)).to eq(1335.5)
#		end
#		it "Prueba de que el impacto medio ambiental para una mujer de entre 20-39 años corresponde" do
#			expect(@alimentoTest.impactoAmbiental(20.48).round(2)).to eq(1024.0)
#		end
#		it "Prueba de que la suma de 2 alimentos da otro alimento con la suma de todas sus propiedades" do
#			alimentoSuma = @alimentoTest + @alimentoTest2
#			expect(alimentoSuma.nombre).to eq("Carne de vaca y Nuez")
#			expect(alimentoSuma.proteinas).to eq(@alimentoTest.proteinas+@alimentoTest2.proteinas)
#			expect(alimentoSuma.carbohidratos).to eq(@alimentoTest.carbohidratos+@alimentoTest2.carbohidratos)
#			expect(alimentoSuma.lipidos).to eq(@alimentoTest.lipidos+@alimentoTest2.lipidos)
#			expect(alimentoSuma.gei).to eq(@alimentoTest.gei+@alimentoTest2.gei)
#			expect(alimentoSuma.terreno).to eq(@alimentoTest.terreno+@alimentoTest2.terreno)
#			expect(alimentoSuma.valorEnergetico).to eq(@alimentoTest.valorEnergetico+@alimentoTest2.valorEnergetico)
#		end 
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
