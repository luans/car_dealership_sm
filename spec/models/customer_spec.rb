require 'rails_helper'

RSpec.describe Customer do
  subject do
    described_class.new(
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
      postal_code: '64.000-000',
      address: 'Rua Teste, 123',
      neighborhood: 'Ininga',
      adjunct: '',
      city: 'Teresina',
      state: 'PI',
      phone: '(86) 3232-3201',
      cell_phone: '(86) 99900-1213',
      email: 'customer@test.com'
    )
  end

  it { should be_valid }
end
