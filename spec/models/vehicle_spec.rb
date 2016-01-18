require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  subject do
    build(:vehicle)
  end

  it 'should can create a new vehicle' do
    expect { subject.save }.to change { subject.persisted? }.to true
  end

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:brand) }
  it { is_expected.to validate_presence_of(:version) }
  it { is_expected.to validate_presence_of(:model_year) }
  it { is_expected.to validate_presence_of(:maker_year) }
  it { is_expected.to validate_presence_of(:license_plate) }
  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to validate_uniqueness_of(:license_plate) }
  it { is_expected.to validate_uniqueness_of(:renavam) }
  it { is_expected.to validate_uniqueness_of(:chassi) }
  it { is_expected.to enumerize(:status).in(:stock, :sold) }

  context 'model_year' do
    it 'can be equal maker_year' do
      subject.maker_year = 2015
      subject.model_year = 2015
      expect(subject).to be_valid
    end

    it 'can be equal maker_year + 1' do
      subject.maker_year = 2014
      subject.model_year = 2015
      expect(subject).to be_valid
    end

    it "can't be less than maker_year" do
      subject.maker_year = 2015
      subject.model_year = 2014
      expect(subject).to be_invalid
    end

    it "can't be equal or more than maker_year + 2" do
      subject.maker_year = 2012
      subject.model_year = 2014
      expect(subject).to be_invalid
    end
  end
end


