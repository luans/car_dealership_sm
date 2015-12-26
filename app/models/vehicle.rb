class Vehicle < ActiveRecord::Base
  extend Enumerize

  STATUS = %i( stock sold )

  enumerize :status, in: STATUS, predicates: true, scope: true
end
