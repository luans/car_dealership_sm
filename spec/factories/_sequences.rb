FactoryGirl.define do
  sequence(:full_name) { |n| "Person #{n}" }
  sequence(:cpf) { |n| n.to_s.rjust(11, "0") }
  sequence(:email) { |n| "person#{n}@test.com" }
  sequence(:license_plate) { |n| "AAA-#{n.to_s.rjust(4, '0')}" }
  sequence(:renavam) { |n| n.to_s.rjust(10, '0') }
  sequence(:chassi) { |n| n.to_s.rjust(10, 'C') }
end
