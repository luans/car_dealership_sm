FactoryGirl.define do
  factory :vehicle do
    brand 'Audi'
    version 'A4 AT'
    maker_year 2014
    model_year 2014
    city 'Teresina'
    uf 'PI'
    color 'Vermelho'
    fuel 'Fuel'
    owner 'Jhon Doe'
    old_license_plate 'BBB-0000'
    status 'stock'
    license_plate
    chassi
    renavam
  end
end
