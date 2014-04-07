class CreatePropertyTransfers < ActiveRecord::Migration
  def change
    create_table :property_transfers do |t|
      t.string :property_type
      t.string :property_address_line_one
      t.string :property_address_line_two
      t.string :property_address_line_three
      t.string :property_city
      t.string :property_state
      t.integer :property_zip_code
      t.integer :property_plus_four_code
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.string :prefix
      t.string :suffix
      t.string :address_line_one
      t.string :address_line_two
      t.string :address_line_three
      t.string :city
      t.string :state
      t.integer :zip_code
      t.integer :plus_four_code
      t.decimal :amount_received, :precision => 10, :scale => 2
      t.integer :client_id
      t.foreign_key :clients
      t.timestamps
    end
  end
end
