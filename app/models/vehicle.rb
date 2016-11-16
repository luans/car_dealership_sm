class Vehicle < ActiveRecord::Base
  extend Enumerize

  STATUS = %i( stock sold )

  enumerize :status, in: STATUS, predicates: true, scope: true

  has_many :sales

  validates_presence_of :license_plate, :brand, :version, :model_year, :maker_year, :status
  validates_uniqueness_of :license_plate, case_sensitive: false
  validates_uniqueness_of :chassi, case_sensitive: false, allow_blank: true
  validates_uniqueness_of :renavam, case_sensitive: false, allow_blank: true
  validates_length_of :license_plate, is: 8
  validates_format_of :license_plate, with: /\A[[:alpha:]]{3}-\d{4}\z/
  validates_format_of :old_license_plate, with: /\A[[:alpha:]]{3}-\d{4}\z/, allow_blank: true
  validate :model_year_validation

  def to_s
    "#{brand} #{version} - #{maker_year}/#{model_year}"
  end

  private

  def model_year_validation
    if model_year && maker_year
      errors.add(:model_year) unless (model_year == maker_year) || (model_year == maker_year + 1)
    end
  end
end
