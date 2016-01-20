class Vehicle < ActiveRecord::Base
  extend Enumerize

  STATUS = %i( stock sold )

  enumerize :status, in: STATUS, predicates: true, scope: true

  validates_presence_of :license_plate, :brand, :version, :model_year, :maker_year, :status
  validates_uniqueness_of :license_plate, :chassi
  validates_uniqueness_of :renavam, case_sensitive: false
  validate :model_year_validation

  private

  def model_year_validation
    if model_year && maker_year
      errors.add(:model_year) unless (model_year == maker_year) || (model_year == maker_year + 1)
    end
  end
end
