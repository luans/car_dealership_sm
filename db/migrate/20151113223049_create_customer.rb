class CreateCustomer < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :full_name, null: false
      t.string :cpf, unique: true, null: false
      t.date :birth_date
      t.string :rg
      t.string :rg_sender
      t.date :rg_expedition
      t.string :place_birth
      t.string :place_birth_uf, limit: 2
      t.string :nacionality
      t.string :mother
      t.string :father
      t.string :postal_code, limit: 9
      t.string :address
      t.string :neighborhood
      t.string :adjunct
      t.string :city
      t.string :state
      t.string :phone
      t.string :cell_phone
      t.string :email, unique: true

      t.timestamps
    end
  end
end
