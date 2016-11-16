class Customer < ActiveRecord::Base
  has_many :sales, foreign_key: :seller_id
  has_many :purchases, class_name: :Sale, foreign_key: :purchaser_id

  validates_presence_of :full_name, :cpf
  validates_length_of :place_birth_uf, is: 2, allow_blank: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, allow_blank: true
  validates_uniqueness_of :email, allow_blank: true
  validates_uniqueness_of :cpf, case_sensitive: false
  validate :old_enough
  validate :rg_expedition_date

  def to_s
    full_name
  end

  private

  # 18 years old or more
  def old_enough
    return false unless birth_date
    old_insufficient = birth_date.advance(years: 18) >= Date.current
    errors.add(:birth_date) if old_insufficient
  end

  def rg_expedition_date
    errors.add(:rg_expedition) if rg_expedition && rg_expedition > Date.current
  end
end
