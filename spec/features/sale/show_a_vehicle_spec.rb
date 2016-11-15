require 'rails_helper'

feature 'Show a vehicle' do
  before do
    create(:sale,
      seller: create(:customer, full_name: 'Seller'),
      purchaser: create(:customer, full_name: 'Purchaser'),
      vehicle: create(:vehicle,  brand: 'Audi', version: 'A4 2.0 AT', maker_year: 2014, model_year: 2015),
      sale_price: 20000.0,
      sale_date: '10/10/2015',
      incoming_invoice_number: '123456',
      incoming_invoice_date: '11/10/2015',
      purchase_price: 22000.0,
      purchase_date: '20/10/2015',
      output_invoice_number: '654321',
      output_invoice_date: '21/10/2015',
      brokerage: false,
      observation: 'Some observations'
    )

    sign_in create(:user)

    visit root_path

    click_on 'Vendas'
    click_on 'Listar vendas'

    expect(page).to have_content 'Seller'
    expect(page).to have_content 'Purchaser'
    expect(page).to have_content 'Audi'
    expect(page).to have_content 'A4 2.0 AT'
    expect(page).to have_content '2014'
    expect(page).to have_content '2015'
    expect(page).to have_content '20/10/2015'
  end

  scenario 'with success' do
    click_on 'mostrar'

    expect(page).to have_content 'Seller'
    expect(page).to have_content 'Purchaser'
    expect(page).to have_content 'Audi'
    expect(page).to have_content 'A4 2.0 AT'
    expect(page).to have_content '2014'
    expect(page).to have_content '2015'
    expect(page).to have_content '10/10/2015'
    expect(page).to have_content 'R$ 20.000,00'
    expect(page).to have_content '20/10/2015'
    expect(page).to have_content 'R$ 22.000,00'
    expect(page).to have_content '123456'
    expect(page).to have_content '11/10/2015'
    expect(page).to have_content '654321'
    expect(page).to have_content '21/10/2015'
    expect(page).to have_content 'não'
    expect(page).to have_content 'Some observations'
  end
end
