class CreateSale < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :vehicle, index: true, null: false, foreign_key: true
      t.references :seller, index: true, null: false
      t.decimal :sale_price, precision: 8, scale: 2, null: false
      t.date :sale_date, null: false
      t.string :incoming_invoice_number
      t.date :incoming_invoice_date
      t.references :purchaser, index: true
      t.decimal :purchase_price, precision: 8, scale: 2
      t.date :purchase_date
      t.string :output_invoice_number
      t.date :output_invoice_date
      t.boolean :brokerage
      t.text :observation

      t.timestamps
    end

    add_foreign_key :sales, :customers, column: :seller_id
    add_foreign_key :sales, :customers, column: :purchaser_id
  end
end
