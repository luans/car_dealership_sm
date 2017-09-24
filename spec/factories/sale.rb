FactoryGirl.define do
  factory :sale do
    association :vehicle, strategy: :build
    association :seller, factory: :customer, strategy: :build
    purchase_price 20000.0
    purchase_date '10/01/2016'
    incoming_invoice_number '123456'
    incoming_invoice_date '10/01/2016'
    association :purchaser, factory: :customer, strategy: :build
    sale_price 22000.0
    sale_date '11/01/2016'
    output_invoice_number '654321'
    output_invoice_date '11/01/2016'
    brokerage false
    observation 'Observation about sale'
  end
end
