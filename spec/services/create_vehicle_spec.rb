require 'rails_helper'

describe CreateVehicle do
  let(:params) do
    {
      brand: 'GM',
      version: 'Camaro SS 6.2 V8 16V 406cv',
      maker_year: '2016',
      model_year: '2016',
      license_plate: 'XXX-1111',
      city: 'Teresina',
      uf: 'PI',
      color: 'Preta',
      fuel: 'Gasolina',
      renavam: '123123123',
      chassi: 'A123A123A123A123A123',
      owner: 'Jhon Doe',
      old_license_plate: nil
    }
  end

  subject { described_class.create(params) }

  context 'save' do
    it { is_expected.to be_truthy }
    it { is_expected.to be_a Vehicle }
    it { is_expected.to be_persisted }

    it 'must return the vehicle created with status stock' do
      expect(subject.status).to eq 'stock'
    end
  end
end
