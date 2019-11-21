require 'Dieta'

describe Dieta do

	before(:all) do
		@dietaEspañola = Dieta.new()
		@dietaEspañola.insertList(Dieta.alimentos["Chocolate"].cantidad=0.473,Dieta.alimentos["Lentejas"].cantidad=4.5,Dieta.alimentos["Nueces"].cantidad=2.09)
	end

	context "Probando que los valores de la clase 'Dieta' corresponden con los esperados" do
		it "Probando que el calculo de las emisiones diarias corresponde" do
			expect(@dietaEspañola.emisiones).to eq(3.5149)
		end
		it "Probando que el calculo del terreno usado diario corresponde" do
			expect(@dietaEspañola.terreno).to eq(33.4192)
		end
	end
	context "Probando que los metodos de la clase 'Dieta' funcionan correctamente" do
		it "Probando que el metodo 'calculoEmisiones' funciona correctamente para un año" do
			expect(@dietaEspañola.calculoEmisiones(365)).to eq(1282.9385)
		end
	end
end
