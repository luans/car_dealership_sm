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
    select 'stock', from: 'Status'

    click_on 'Criar Vehicle'

    expect(page).to have_content 'Vehicle created successful'
  end
end
