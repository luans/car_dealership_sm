require 'rails_helper'

describe Customer do
  it 'create a customer' do
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

    click_on 'Create Customer'

    expect(page).to have_content 'Customer created successfull'
    expect(page).to have_content 'Customer Test'
    expect(page).to have_content '000.000.000-00'
  end
end
