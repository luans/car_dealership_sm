class AddTimestampsToCustomer < ActiveRecord::Migration
  def change
    add_timestamps(:customers)
  end
end
