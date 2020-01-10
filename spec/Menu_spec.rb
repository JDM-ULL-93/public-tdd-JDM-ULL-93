require 'gema'

describe Menu do
	context "Probando que los metodos de inicializacion funcionan correctamente" do
		it "Prueba de que el objeto se crea correctamente" do
			menu = Menu.new("Menu prueba") do
				descripcion "Descripcion de menu de prueba"
				componente 	:descripcion => "Hamburguesa especial de la casa",
						:precio => 4.25,
						:alimento =>
						[{ 
						  :descripcion => "carne de vaca",
						  :gramos => 100
						},
						{ 
						  :descripcion => "huevos",
					          :gramos => 20
						}]
				componente 	:descripcion => "Papas pequeñas",
						:precio => 1.75
				componente	:descripcion => "Refrescos de lata",
						:precio => 1.50
				precio 7.50
			end
			puts menu
			expect(menu.descripcion).to eq("Descripcion de menu de prueba")
			expect(menu.precio).to eq(7.50)
			expect(menu.size).to eq(3)
			expect(menu[1].nombre).to eq("Papas pequeñas")
			expect(menu[2].precio).to eq(1.50)
		end		
	end
end

