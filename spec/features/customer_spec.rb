require 'rails_helper'

describe Customer do
  it 'create' do
    visit '/customers/new'

    fill_in 'Full name', with: 'Customer Test'
    fill_in 'Cpf', with: '000.000.000-00'
    fill_in 'Birth date', with: '10/10/1990'
    fill_in 'Rg', with: '1.234.567'
    fill_in 'Rg sender', with: 'SSP-PI'
    fill_in 'Rg expedition', with: '10/10/2014'
    fill_in 'Place birth', with: 'My City'
    fill_in 'Place birth uf', with: 'CI'
    fill_in 'Nacionality', with: 'City native'
    fill_in 'Mother', with: 'Customers mother'
    fill_in 'Father', with: 'Customers father'
    fill_in 'Postal code', with: '64000-000'
    fill_in 'Address', with: 'St. Seven, 34'
    fill_in 'Neighborhood', with: 'Area test'
    fill_in 'Adjunct', with: ''
    fill_in 'City', with: 'My City'
    fill_in 'State', with: 'CI'
    fill_in 'Phone', with: '(86) 3232-3232'
    fill_in 'Cell phone', with: '(86) 99900-1234'
    fill_in 'Email', with: 'customer@test.com'

    click_on 'Criar Customer'

    expect(page).to have_content 'Customer created successful'
    expect(page).to have_content 'Customer Test'
    expect(page).to have_content '000.000.000-00'
  end

  it 'update' do
    customer = described_class.create!(
      full_name: 'Customer Test',
      cpf: '000.000.000-00',
      birth_date: '12/02/1990',
      rg: '2.341.231',
      rg_sender: 'SSP',
      rg_expedition: '10/10/2014',
      place_birth: 'Teresina',
      place_birth_uf: 'PI',
      nacionality: 'Brasileiro',
      mother: 'Customers mother',
      father: 'Customers father',
      postal_code: '64000-000',
      address: 'Rua Teste, 123',
      neighborhood: 'Ininga',
      adjunct: '',
      city: 'Teresina',
      state: 'PI',
      phone: '(86) 3232-3201',
      cell_phone: '(86) 99900-1213',
      email: 'customer@test.com'
    )

    visit edit_customer_path(customer)

    fill_in 'Full name', with: 'Customer edited'
    fill_in 'Cpf', with: '000.000.000-01'
    fill_in 'Birth date', with: '10/10/1991'
    fill_in 'Rg', with: '1.234.568'
    fill_in 'Rg sender', with: 'SSP-MA'
    fill_in 'Rg expedition', with: '10/10/2015'
    fill_in 'Place birth', with: 'My City edited'
    fill_in 'Place birth uf', with: 'ED'
    fill_in 'Nacionality', with: 'City native edited'
    fill_in 'Mother', with: 'Mother edited'
    fill_in 'Father', with: 'Father edited'
    fill_in 'Postal code', with: '64000-001'
    fill_in 'Address', with: 'St. Eight, 35'
    fill_in 'Neighborhood', with: 'Area edited'
    fill_in 'Adjunct', with: 'Any'
    fill_in 'City', with: 'City Edited'
    fill_in 'State', with: 'ED'
    fill_in 'Phone', with: '(86) 3232-3233'
    fill_in 'Cell phone', with: '(86) 99900-1235'
    fill_in 'Email', with: 'customer@test.com.ed'

    click_on 'Atualizar Customer'

    expect(page).to have_content 'Customer edited'
    expect(page).to have_content '000.000.000-01'
    expect(page).to have_content '10/10/1991'
    expect(page).to have_content '1.234.568'
    expect(page).to have_content 'SSP-MA'
    expect(page).to have_content '10/10/2015'
    expect(page).to have_content 'My City edited'
    expect(page).to have_content 'ED'
    expect(page).to have_content 'City native edited'
    expect(page).to have_content 'Mother edited'
    expect(page).to have_content 'Father edited'
    expect(page).to have_content '64000-001'
    expect(page).to have_content 'St. Eight, 35'
    expect(page).to have_content 'Area edited'
    expect(page).to have_content 'Any'
    expect(page).to have_content 'City Edited'
    expect(page).to have_content 'ED'
    expect(page).to have_content '(86) 3232-3233'
    expect(page).to have_content '(86) 99900-1235'
    expect(page).to have_content 'customer@test.com.ed'
  end
end
