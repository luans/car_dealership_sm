require 'rails_helper'

feature 'Update a sale' do
  before do
    create(:sale,
      seller: create(:customer, full_name: 'Seller'),
      purchaser: create(:customer, full_name: 'Purchaser'),
      vehicle: create(:vehicle,  brand: 'Audi', version: 'A4 2.0 AT', maker_year: 2014, model_year: 2015),
      sale_price: 20000.0,
      sale_date: '10/01/2016',
      purchase_price: 22000.0,
      purchase_date: '11/01/2016',
      brokerage: false
    )

    visit root_path

    click_on 'Vendas'
    click_on 'Listar vendas'
  end

  scenario 'with success' do
    click_on 'editar'

    within "fieldset[name='vehicle-informations']" do
      expect(page).to have_field 'Marca', with: 'Audi'
      expect(page).to have_field 'Versão', with: 'A4 2.0 AT'
      expect(page).to have_field 'Ano fabricação', with: '2014'
      expect(page).to have_field 'Ano modelo', with: '2015'

      fill_in 'Marca', with: 'Nissan'
      fill_in 'Versão', with: 'Sentra 2.0 SE MT'
      fill_in 'Ano fabricação', with: 2013
      fill_in 'Ano modelo', with: 2013
      fill_in 'Placa', with: "AAA-0001", match: :prefer_exact
      fill_in 'Cidade', with: 'Timon'
      fill_in 'UF', with: 'MA'
      fill_in 'Cor', with: 'Cinza'
      fill_in 'Combustível', with: 'Gasolina'
      fill_in 'Renavam', with: '10203041'
      fill_in 'Chassi', with: '9BWZZZ377VT004252'
      fill_in 'Proprietário', with: 'Jhon Doe 2'
      fill_in 'Placa anterior', with: 'BBB-0001'
    end

    within "fieldset[name='seller-informations']" do
      expect(page).to have_field 'Nome completo', with: 'Seller'

      fill_in 'Nome completo', with: 'Seller Edited'
      fill_in 'CPF', with: '000.000.000-03'
      fill_in 'Data de nascimento', with: '10/01/1991'
      fill_in 'RG', with: '1.234.568'
      fill_in 'Emissor', with: 'SSP-PI'
      fill_in 'Data de expedição', with: '10/01/2015'
      fill_in 'Naturalidade', with: 'Seller City'
      fill_in 'UF', with: 'CE'
      fill_in 'Nacionalidade', with: 'Native'
      fill_in 'Mãe', with: 'Seller mother edited'
      fill_in 'Pai', with: 'Seller father edited'
      fill_in 'CEP', with: '64000-003'
      fill_in 'Endereço', with: 'St. Seven, 35'
      fill_in 'Bairro', with: 'Area test edited'
      fill_in 'Complemento', with: 'Seller complement edited'
      fill_in 'Cidade', with: 'Seller current city edited'
      fill_in 'Estado', with: 'SE'
      fill_in 'Telefone', with: '(86) 3232-3234'
      fill_in 'Celular', with: '(86) 99900-1236'
      fill_in 'E-mail', with: 'seller_edited@test.com'

      fill_in 'Preço de venda', with: 21000.0
      fill_in 'Data da venda', with: '10/01/2015'
    end

    within "fieldset[name='purchaser-informations']" do
      expect(page).to have_field 'Nome completo', with: 'Purchaser'

      fill_in 'Nome completo', with: 'Purchaser Edited'
      fill_in 'CPF', with: '000.000.000-04'
      fill_in 'Data de nascimento', with: '10/01/199'
      fill_in 'RG', with: '1.234.568'
      fill_in 'Emissor', with: 'SSP-MA'
      fill_in 'Data de expedição', with: '10/11/2015'
      fill_in 'Naturalidade', with: 'Purchaser City Edited'
      fill_in 'UF', with: 'CE'
      fill_in 'Nacionalidade', with: 'Native'
      fill_in 'Mãe', with: 'Purchaser mother edited'
      fill_in 'Pai', with: 'Purchaser father edited'
      fill_in 'CEP', with: '64000-004'
      fill_in 'Endereço', with: 'St. Seven, 38'
      fill_in 'Bairro', with: 'Purchaser Area edited'
      fill_in 'Complemento', with: 'Purchaser complement edited'
      fill_in 'Cidade', with: 'Purchaser current city edited'
      fill_in 'Estado', with: 'PS'
      fill_in 'Telefone', with: '(86) 3232-3213'
      fill_in 'Celular', with: '(86) 99900-1223'
      fill_in 'E-mail', with: 'purchaser_edited@test.com'

      fill_in 'Preço de compra', with: 23000.0
      fill_in 'Data da compra', with: '20/01/2015'
    end

    within "fieldset[name='sale-informations']" do
      fill_in 'NFE de entrada', with: '123456'
      fill_in 'Data de entrada NFE', with: '11/01/2015'
      fill_in 'Data de entrada NFE', with: '11/01/2015'
      fill_in 'NFE de saída', with: '654321'
      fill_in 'Data de saída NFE', with: '21/01/2015'
      uncheck 'Corretagem'
      fill_in 'Observação', with: 'Observation about sale edited'
    end

    click_on 'Atualizar Venda'

    expect(page).to have_content 'Venda atualizado com sucesso'

    expect(page).to have_content 'Nissan'
    expect(page).to have_content 'Sentra 2.0 SE MT'
    expect(page).to have_content 'Seller Edited'
    expect(page).to have_content 'Purchaser Edited'
    expect(page).to have_content '123456'
    expect(page).to have_content '654321'
    expect(page).to have_content '10/01/2015'
    expect(page).to have_content '11/01/2015'
    expect(page).to have_content '20/01/2015'
    expect(page).to have_content '21/01/2015'
    expect(page).to have_content 'Observation about sale edited'
  end
end
