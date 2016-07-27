require 'rails_helper'

describe Sale, type: :model do
  subject { build(:sale) }

  it { is_expected.to belong_to(:vehicle) }
  it { is_expected.to belong_to(:seller).class_name('Customer') }
  it { is_expected.to belong_to(:purchaser).class_name('Customer') }
  it { is_expected.to accept_nested_attributes_for(:vehicle) }
  it { is_expected.to accept_nested_attributes_for(:seller) }
  it { is_expected.to accept_nested_attributes_for(:purchaser) }

  context 'validations' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:vehicle) }
    it { is_expected.to validate_presence_of(:seller) }
    it { is_expected.to validate_presence_of(:sale_price) }
    it { is_expected.to validate_presence_of(:purchaser) }
    it { is_expected.to validate_presence_of(:purchase_price) }

    context 'sale date' do
      it { is_expected.to validate_presence_of(:sale_date) }
      it { is_expected.to date_cannot_be_in_the_future(:sale_date) }
    end

    context 'purchase date' do
      it { is_expected.to validate_presence_of(:purchase_date) }

      it 'cannot be less than sale date' do
        subject.sale_date = Date.new(2016, 10, 10)
        subject.purchase_date = Date.new(2016, 10, 9)

        is_expected.to be_invalid
        expect(subject.errors[:purchase_date]).to include('deve ser maior ou igual a data de venda')
      end

      it { is_expected.to date_cannot_be_in_the_future(:purchase_date) }
    end

    context 'incoming invoice date' do
      it { is_expected.to date_cannot_be_in_the_future(:incoming_invoice_date) }
    end

    context 'output invoice date' do
      it 'cannot be less than incoming invoice date' do
        subject.incoming_invoice_date = Date.new(2016, 10, 11)
        subject.output_invoice_date = Date.new(2016, 10, 10)

        is_expected.to be_invalid
        expect(subject.errors[:output_invoice_date]).to include('deve ser maior ou igual a data de entrada NFE')
      end

      it { is_expected.to date_cannot_be_in_the_future(:output_invoice_date) }
    end

    it 'output invoice number cannot be equal to incoming invoice number' do
      subject.incoming_invoice_number = '12345'
      subject.output_invoice_number = '12345'

      is_expected.to be_invalid
      expect(subject.errors[:output_invoice_number]).to include('não deve ser igual a NFE de entrada')
    end

    context 'brokerage' do
      it 'can be true' do
        subject.brokerage = true
        expect(subject).to be_valid
      end

      it 'can be false' do
        subject.brokerage = false
        expect(subject).to be_valid
      end

      it 'cannot be nil' do
        subject.brokerage = nil
        expect(subject).to be_invalid
      end
    end
  end
end
