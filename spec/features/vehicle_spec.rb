require 'rails_helper'

describe Vehicle do
  it 'create' do
    visit new_vehicle_path

    fill_in 'Brand', with: 'Audi'
    fill_in 'Version', with: 'A4 2.0 AT'
    fill_in 'Maker year', with: 2014
    fill_in 'Model year', with: 2014
    fill_in 'License plate', with: "AAA0000"
    fill_in 'City', with: 'Teresina'
    fill_in 'Uf', with: 'PI'
    fill_in 'Color', with: 'Vermelho'
    fill_in 'Fuel', with: 'Flex'
    fill_in 'Renavam', with: '10203040'
    fill_in 'Chassi', with: '9BWZZZ377VT004251'
    fill_in 'Owner', with: 'Jhon Doe'
    fill_in 'Old license plate', with: 'BBB-0000'
    select 'Estoque', from: 'Status'

    click_on 'Criar Vehicle'

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


    expect(page).to have_content 'Vehicle created successful'
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

    fill_in 'Brand', with: 'Audi edited'
    fill_in 'Version', with: 'TT 3.0 Aut'
    fill_in 'Maker year', with: 2015
    fill_in 'Model year', with: 2015
    fill_in 'License plate', with: 'AAA1111'
    fill_in 'City', with: 'Timon'
    fill_in 'Uf', with: 'MA'
    fill_in 'Color', with: 'Branco'
    fill_in 'Fuel', with: 'Gasolina'
    fill_in 'Renavam', with: '10203041'
    fill_in 'Chassi', with: '9BWZZZ377VT004252'
    fill_in 'Owner', with: 'Jhon Cena'
    fill_in 'Old license plate', with: 'BBB-1111'
    select 'Vendido', from: 'Status'

    click_on 'Atualizar Vehicle'

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
