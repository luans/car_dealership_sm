require 'rspec/expectations'

RSpec::Matchers.define :date_cannot_be_in_the_future do |date|
  match do |object|
    object.public_send("#{date}=", Date.tomorrow)
    object.invalid?
    object.errors[date.to_sym].include? 'não deve ser no futuro'
  end

  description { "validate that #{date} cannot be in the future" }
end
