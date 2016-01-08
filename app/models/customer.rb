class Customer < ActiveRecord::Base
  validates_presence_of :full_name, :cpf
  validates_length_of :place_birth_uf, is: 2
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_uniqueness_of :cpf, :email
  validate :old_enough
  validate :rg_expedition_date

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
