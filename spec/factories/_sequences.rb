FactoryGirl.define do
  sequence(:full_name) { |n| "Person #{n}" }
  sequence(:cpf) { |n| n.to_s.rjust(11, "0") }
  sequence(:email) { |n| "person#{n}@test.com" }
end
