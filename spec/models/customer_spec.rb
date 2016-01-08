require 'rails_helper'

RSpec.describe Customer, type: :model do
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
  end

  it 'should can create a new customer' do
    expect{ subject.save }.to change { subject.persisted? }.to true
  end

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:full_name) }
  it { is_expected.to validate_presence_of(:cpf) }
  it { is_expected.to validate_length_of(:place_birth_uf).is_equal_to(2) }
  it { is_expected.to validate_uniqueness_of(:cpf) }
  it { is_expected.to validate_uniqueness_of(:email) }

  it 'should require email has a valid format' do
    subject.email = 'jhon.doe@example.com'
    expect(subject).to be_valid
  end

  context 'date' do
    it 'should require old should to be enough (18 or more)' do
      subject.birth_date = Date.current - 17.years
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to include 'Data de nascimento não é válido'
    end

    it 'should require rg_expedition should be equal or less the current date' do
      subject.rg_expedition = Date.tomorrow
      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to include 'Data de expedição não é válido'
    end
  end
end