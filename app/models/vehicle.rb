class Vehicle < ActiveRecord::Base
  extend Enumerize

  STATUS = %i( stock sold )

  enumerize :status, in: STATUS, predicates: true, scope: true

  validates_presence_of :license_plate, :brand, :version, :model_year, :maker_year, :status
end
