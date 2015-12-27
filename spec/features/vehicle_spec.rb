require 'rails_helper'

describe Vehicle do
  before do
    visit root_path
  end

  it 'create' do
    click_on 'Cadastrar veículo'

    fill_in 'Marca', with: 'Audi'
    fill_in 'Versão', with: 'A4 2.0 AT'
    fill_in 'Ano fabricação', with: 2014
    fill_in 'Ano modelo', with: 2014
    fill_in 'Placa', with: "AAA0000"
    fill_in 'Cidade', with: 'Teresina'
    fill_in 'UF', with: 'PI'
    fill_in 'Cor', with: 'Vermelho'
    fill_in 'Combustível', with: 'Flex'
    fill_in 'Renavam', with: '10203040'
    fill_in 'Chassi', with: '9BWZZZ377VT004251'
    fill_in 'Proprietário', with: 'Jhon Doe'
    fill_in 'Placa anterior', with: 'BBB-0000'
    select 'Estoque', from: 'Status'

    click_on 'Criar Veículo'

    expect(page).to have_content 'Audi'
    expect(page).to have_content 'A4 2.0 AT'
    expect(page).to have_content '2014'
    expect(page).to have_content '2014'
    expect(page).to have_content 'AAA0000'
    expect(page).to have_content 'Teresina'
    expect(page).to have_content 'PI'
    expect(page).to have_content 'Vermelho'
    expect(page).to have_content 'Flex'
    expect(page).to have_content '10203040'
    expect(page).to have_content '9BWZZZ377VT004251'
    expect(page).to have_content 'Jhon Doe'
    expect(page).to have_content 'BBB-0000'
    expect(page).to have_content 'Estoque'

    expect(page).to have_content 'Veículo criado com sucesso'
  end

  it 'edit' do
    vehicle = described_class.create!(
      brand: 'Audi',
      version: 'A4 AT',
      maker_year: 2014,
      model_year: 2014,
      license_plate: 'AAA0000',
      city: 'Teresina',
      uf: 'PI',
      color: 'Vermelho',
      fuel: 'Fuel',
      renavam: '1020304050',
      chassi: '9BWZZZ377VT004251',
      owner: 'Jhon Doe',
      old_license_plate: 'BBB-0000',
      status: 'stock'
    )

    visit edit_vehicle_path(vehicle)

    fill_in 'Marca', with: 'Audi edited'
    fill_in 'Versão', with: 'TT 3.0 Aut'
    fill_in 'Ano fabricação', with: 2015
    fill_in 'Ano modelo', with: 2015
    fill_in 'Placa', with: 'AAA1111'
    fill_in 'Cidade', with: 'Timon'
    fill_in 'UF', with: 'MA'
    fill_in 'Cor', with: 'Branco'
    fill_in 'Combustível', with: 'Gasolina'
    fill_in 'Renavam', with: '10203041'
    fill_in 'Chassi', with: '9BWZZZ377VT004252'
    fill_in 'Proprietário', with: 'Jhon Cena'
    fill_in 'Placa anterior', with: 'BBB-1111'
    select 'Vendido', from: 'Status'

    click_on 'Atualizar Veículo'

    expect(page).to have_content 'Audi edited'
    expect(page).to have_content 'TT 3.0 Aut'
    expect(page).to have_content '2015'
    expect(page).to have_content '2015'
    expect(page).to have_content 'AAA1111'
    expect(page).to have_content 'Timon'
    expect(page).to have_content 'MA'
    expect(page).to have_content 'Branco'
    expect(page).to have_content 'Gasolina'
    expect(page).to have_content '10203041'
    expect(page).to have_content '9BWZZZ377VT004252'
    expect(page).to have_content 'Jhon Cena'
    expect(page).to have_content 'BBB-1111'
    expect(page).to have_content 'Vendido'
  end
end
