class Customer < ActiveRecord::Base
  validates_presence_of :full_name, :cpf
  validates_length_of :place_birth_uf, is: 2
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validate :old_enough
  validate :rg_expedition_date

  private

  # 18 years old or more
  def old_enough
    if self.birth_date
      old_insufficient = (self.birth_date + 18.years) > Date.today
      errors.add(:birth_date) if old_insufficient
    end
  end

  def rg_expedition_date
    errors.add(:rg_expedition) if self.rg_expedition && self.rg_expedition > Date.today
  end
end
