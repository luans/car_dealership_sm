FactoryGirl.define do
  factory :vehicle do
    brand 'Audi'
    version 'A4 AT'
    maker_year 2014
    model_year 2014
    license_plate 'AAA-0000'
    city 'Teresina'
    uf 'PI'
    color 'Vermelho'
    fuel 'Fuel'
    renavam '1020304050'
    chassi '9BWZZZ377VT004251'
    owner 'Jhon Doe'
    old_license_plate 'BBB-0000'
    status 'stock'
  end
end
