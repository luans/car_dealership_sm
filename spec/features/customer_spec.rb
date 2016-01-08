require 'rails_helper'

describe Customer do
  before do
    visit root_path
  end

  it 'create' do
    click_on 'Cadastrar cliente'

    fill_in 'Nome completo', with: 'Customer Test'
    fill_in 'CPF', with: '000.000.000-00'
    fill_in 'Data de nascimento', with: '10/10/1990'
    fill_in 'RG', with: '1.234.567'
    fill_in 'Emissor', with: 'SSP-PI'
    fill_in 'Data de expedição', with: '10/10/2014'
    fill_in 'Naturalidade', with: 'My City'
    fill_in 'UF', with: 'CI'
    fill_in 'Nacionalidade', with: 'City native'
    fill_in 'Mãe', with: 'Customers mother'
    fill_in 'Pai', with: 'Customers father'
    fill_in 'CEP', with: '64000-000'
    fill_in 'Endereço', with: 'St. Seven, 34'
    fill_in 'Bairro', with: 'Area test'
    fill_in 'Complemento', with: ''
    fill_in 'Cidade', with: 'My City'
    fill_in 'Estado', with: 'CI'
    fill_in 'Telefone', with: '(86) 3232-3232'
    fill_in 'Celular', with: '(86) 99900-1234'
    fill_in 'E-mail', with: 'customer@test.com'

    click_on 'Criar Cliente'

    expect(page).to have_content 'Cliente criado com sucesso'

    expect(page).to have_content 'Customer Test'
    expect(page).to have_content '000.000.000-00'
    expect(page).to have_content '10/10/1990'
    expect(page).to have_content '1.234.567'
    expect(page).to have_content 'SSP-PI'
    expect(page).to have_content '10/10/2014'
    expect(page).to have_content 'My City'
    expect(page).to have_content 'CI'
    expect(page).to have_content 'City native'
    expect(page).to have_content 'Customers mother'
    expect(page).to have_content 'Customers father'
    expect(page).to have_content '64000-000'
    expect(page).to have_content 'St. Seven, 34'
    expect(page).to have_content 'Area test'
    expect(page).to have_content ''
    expect(page).to have_content 'My City'
    expect(page).to have_content 'CI'
    expect(page).to have_content '(86) 3232-3232'
    expect(page).to have_content '(86) 99900-1234'
    expect(page).to have_content 'customer@test.com'
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

    click_on 'Listar clientes'
    find_link('editar', href: edit_customer_path(customer)).click

    fill_in 'Nome completo', with: 'Customer edited'
    fill_in 'CPF', with: '000.000.000-01'
    fill_in 'Data de nascimento', with: '10/10/1991'
    fill_in 'RG', with: '1.234.568'
    fill_in 'Emissor', with: 'SSP-MA'
    fill_in 'Data de expedição', with: '10/10/2015'
    fill_in 'Naturalidade', with: 'My City edited'
    fill_in 'UF', with: 'ED'
    fill_in 'Nacionalidade', with: 'City native edited'
    fill_in 'Mãe', with: 'Mother edited'
    fill_in 'Pai', with: 'Father edited'
    fill_in 'CEP', with: '64000-001'
    fill_in 'Endereço', with: 'St. Eight, 35'
    fill_in 'Bairro', with: 'Area edited'
    fill_in 'Complemento', with: 'Any'
    fill_in 'Cidade', with: 'City Edited'
    fill_in 'Estado', with: 'ED'
    fill_in 'Telefone', with: '(86) 3232-3233'
    fill_in 'Celular', with: '(86) 99900-1235'
    fill_in 'E-mail', with: 'customer@test.com.ed'

    click_on 'Atualizar Cliente'

    expect(page).to have_content 'Cliente atualizado com sucesso'

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
