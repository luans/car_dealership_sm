class ChangeVehiclesLicensePlateAndOldLicensePlate < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :vehicles do |t|
        dir.up do
          t.change :license_plate, :string, unique: true, limit: 8, null: false
          t.change :old_license_plate, :string, limit: 8
        end

        dir.down do
          t.change :license_plate, :string, unique: true, limit: 7, null: false
          t.change :old_license_plate, :string
        end
      end
    end
  end
end
