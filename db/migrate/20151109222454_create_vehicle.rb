class CreateVehicle < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :brand, null: false
      t.string :version, null: false
      t.integer :maker_year, limit: 4, null: false
      t.integer :model_year, limit: 4, null: false
      t.string :license_plate, unique: true, limit: 7, null: false
      t.string :city
      t.string :uf, limit: 2
      t.string :color
      t.string :fuel
      t.string :renavam, unique: true
      t.string :chassi, unique: true
      t.string :owner
      t.string :old_license_plate
      t.string :status

      t.timestamps
    end
  end
end
