require 'rails_helper'

RSpec.describe Customer, type: :model do
  subject { build(:customer) }

  it 'should can create a new customer' do
    expect{ subject.save }.to change { subject.persisted? }.to true
  end

  it '#to_s' do
    subject.full_name = 'Jhon Doe'
    expect(subject.to_s).to eq 'Jhon Doe'
  end

  context 'validations' do
    it { is_expected.to be_valid }
    it { is_expected.to have_many(:sales).with_foreign_key('seller_id') }
    it { is_expected.to have_many(:purchases).class_name('Sale').with_foreign_key('purchaser_id') }
    it { is_expected.to validate_presence_of(:full_name) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_length_of(:place_birth_uf).is_equal_to(2) }
    it { is_expected.to validate_uniqueness_of(:cpf).case_insensitive }
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
end
