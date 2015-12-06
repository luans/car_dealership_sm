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

  context 'validations' do
    it { should be_valid }

    it 'should can create a new user' do
      expect{ subject.save }.to change { subject.persisted? }.to true
    end

    context 'presence' do
      it '.full_name should be present' do
        expect{ subject.full_name = nil }.to change { subject.valid? }.to false
        expect(subject.errors.full_messages).to include 'Nome completo não pode ficar em branco'
      end

      it '.cpf should be present' do
        expect{ subject.cpf = nil }.to change { subject.valid? }.to false
        expect(subject.errors.full_messages).to include 'CPF não pode ficar em branco'
      end
    end

    context 'date' do
      it '.birth_date old should be enough (18 or more)' do
        expect{ subject.birth_date = Date.today - 17.years }.to change { subject.valid? }.to false
        expect(subject.errors.full_messages).to include 'Data de nascimento não é válido'
      end

      it '.rg_expedition should be equal or less the current date' do
        expect{ subject.rg_expedition = Date.today + 1 }.to change { subject.valid? }.to false
        expect(subject.errors.full_messages).to include 'Data de expedição não é válido'
      end
    end

    it '.place_birth_uf should be 2 characteres' do
      expect{ subject.place_birth_uf = 'P' }.to change { subject.valid? }.to false
      expect(subject.errors.full_messages).to include 'UF não possui o tamanho esperado (2 caracteres)'
    end

    it '.email should be format valid' do
      subject.email = 'jhon.doe@example.com'
      expect(subject).to be_valid
    end
  end
end
