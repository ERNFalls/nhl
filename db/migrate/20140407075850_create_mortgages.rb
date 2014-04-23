class CreateMortgages < ActiveRecord::Migration
  def change
    create_table :mortgages do |t|
      t.string :mortgage_holder
      t.string :account_no
      t.string :address_line_one
      t.string :address_line_two
      t.string :address_line_three
      t.string :city
      t.string :state
      t.integer :zip_code
      t.integer :plus_four_code
      t.decimal :balance, :precision => 10, :scale => 2
      t.decimal :overdue_payment, :precision => 10, :scale => 2
      t.integer :client_id
      t.integer :property_id
      t.foreign_key :clients
      t.foreign_key :properties
      t.timestamps
    end
  end
end
