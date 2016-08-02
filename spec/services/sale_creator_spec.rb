require 'rails_helper'

describe SaleCreator do
  let(:vehicle_attributes)    { attributes_for :vehicle }
  let(:seller_attributes)     { attributes_for :customer }
  let(:purchaser_attributes)  { attributes_for :customer }
  let(:sale_attributes)       { attributes_for :sale }

  let(:attributes) do
    sale_attributes.
      merge("vehicle_attributes" => vehicle_attributes).
      merge("seller_attributes" => seller_attributes).
      merge("purchaser_attributes" => purchaser_attributes)
  end

  context '#create' do
    subject{ described_class.create(attributes) }

    it { is_expected.to be_persisted }

    it 'must create a sale with sold vehicle' do
      expect(subject.vehicle.status).to eq 'sold'
    end
  end
end
