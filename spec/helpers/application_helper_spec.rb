require 'rails_helper'

describe ApplicationHelper do
  describe '#label_value' do
    it 'returns the i18n attribute name as label and value' do
      customer = build(:customer, full_name: 'Jhon Doe')
      expect(helper.label_value(customer, :full_name)).to eq '<strong>Nome completo</strong>: Jhon Doe'
    end

    it 'when a block is given returns the block as content' do
      customer = build(:customer, full_name: 'Jhon Doe')
      expect(helper.label_value(customer, :full_name) { 'Other value' }).to eq '<strong>Nome completo</strong>: Other value'
    end
  end
end
