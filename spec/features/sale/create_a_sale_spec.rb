require 'rails_helper'

feature 'Create a sale' do
  before do
    sign_in create(:user)

    visit root_path

    click_on 'Vendas'
    click_on 'Cadastrar venda'
  end

  scenario 'with success' do
    within "fieldset[name='vehicle-informations']" do
      fill_in 'Marca', with: 'Audi'
      fill_in 'Versão', with: 'A4 2.0 AT'
      fill_in 'Ano fabricação', with: 2014
      fill_in 'Ano modelo', with: 2014
      fill_in 'Placa', with: "AAA-0000", match: :prefer_exact
      fill_in 'Cidade', with: 'Teresina'
      fill_in 'UF', with: 'PI'
      fill_in 'Cor', with: 'Vermelho'
      fill_in 'Combustível', with: 'Flex'
      fill_in 'Renavam', with: '10203040'
      fill_in 'Chassi', with: '9BWZZZ377VT004251'
      fill_in 'Proprietário', with: 'Jhon Doe'
      fill_in 'Placa anterior', with: 'BBB-0000'
    end

    within "fieldset[name='seller-informations']" do
      fill_in 'Nome completo', with: 'Seller'
      fill_in 'CPF', with: '000.000.000-00'
      fill_in 'Data de nascimento', with: '10/10/1990'
      fill_in 'RG', with: '1.234.567'
      fill_in 'Emissor', with: 'SSP-PI'
      fill_in 'Data de expedição', with: '10/10/2014'
      fill_in 'Naturalidade', with: 'Seller City'
      fill_in 'UF', with: 'CI'
      fill_in 'Nacionalidade', with: 'Native'
      fill_in 'Mãe', with: 'Seller mother'
      fill_in 'Pai', with: 'Seller father'
      fill_in 'CEP', with: '64000-000'
      fill_in 'Endereço', with: 'St. Seven, 34'
      fill_in 'Bairro', with: 'Area test'
      fill_in 'Complemento', with: 'Seller complement'
      fill_in 'Cidade', with: 'Seller current city'
      fill_in 'Estado', with: 'SS'
      fill_in 'Telefone', with: '(86) 3232-3232'
      fill_in 'Celular', with: '(86) 99900-1234'
      fill_in 'E-mail', with: 'seller@test.com'

      fill_in 'Preço de venda', with: 20000.0
      fill_in 'Data da venda', with: '10/01/2016'
    end

    within "fieldset[name='purchaser-informations']" do
      fill_in 'Nome completo', with: 'Purchaser'
      fill_in 'CPF', with: '000.000.000-01'
      fill_in 'Data de nascimento', with: '10/10/1991'
      fill_in 'RG', with: '1.234.568'
      fill_in 'Emissor', with: 'SSP-PI'
      fill_in 'Data de expedição', with: '10/10/2015'
      fill_in 'Naturalidade', with: 'Purchaser City'
      fill_in 'UF', with: 'CI'
      fill_in 'Nacionalidade', with: 'Native'
      fill_in 'Mãe', with: 'Purchaser mother'
      fill_in 'Pai', with: 'Purchaser father'
      fill_in 'CEP', with: '64000-001'
      fill_in 'Endereço', with: 'St. Seven, 35'
      fill_in 'Bairro', with: 'Purchaser Area'
      fill_in 'Complemento', with: 'Purchaser complement'
      fill_in 'Cidade', with: 'Purchaser current city'
      fill_in 'Estado', with: 'PS'
      fill_in 'Telefone', with: '(86) 3232-3233'
      fill_in 'Celular', with: '(86) 99900-1233'
      fill_in 'E-mail', with: 'purchaser@test.com'

      fill_in 'Preço de compra', with: 22000.0
      fill_in 'Data da compra', with: '20/01/2016'
    end

    within "fieldset[name='sale-informations']" do
      fill_in 'NFE de entrada', with: '123456'
      fill_in 'Data de entrada NFE', with: '21/01/2016'
      fill_in 'NFE de saída', with: '123457'
      fill_in 'Data de saída NFE', with: '22/01/2016'
      check 'Corretagem'
      fill_in 'Observação', with: 'Observation about sale'
    end

    click_on 'Criar Venda'

    expect(page).to have_content 'Venda criado com sucesso'

    expect(page).to have_content 'Audi'
    expect(page).to have_content 'A4 2.0 AT'
    expect(page).to have_content 'Seller'
    expect(page).to have_content 'Purchaser'
    expect(page).to have_content '123456'
    expect(page).to have_content '10/01/2016'
    expect(page).to have_content '20/01/2016'
    expect(page).to have_content '21/01/2016'
    expect(page).to have_content '22/01/2016'
    expect(page).to have_content 'Observation about sale'
  end
end
