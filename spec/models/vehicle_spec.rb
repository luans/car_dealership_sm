require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  subject do
    Vehicle.new(
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
  end

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:brand) }
  it { is_expected.to validate_presence_of(:version) }
  it { is_expected.to validate_presence_of(:model_year) }
  it { is_expected.to validate_presence_of(:maker_year) }
  it { is_expected.to validate_presence_of(:license_plate) }
  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to enumerize(:status).in(:stock, :sold) }
end


