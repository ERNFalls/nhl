class CreateProperty < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.boolean :rent, :default => false
      t.string :property_type
      t.date :date_of_purchase
      t.string :address_line_one
      t.string :address_line_two
      t.string :address_line_three
      t.string :city
      t.string :state
      t.integer :zip_code
      t.integer :plus_four_code
      t.string :association_name
      t.string :association_address_line_one
      t.string :association_address_line_two
      t.string :association_address_line_three
      t.string :association_city
      t.string :association_state
      t.integer :association_zip_code
      t.integer :association_plus_four_code
      t.decimal :association_balance, :precision => 10, :scale => 2
      t.integer :client_id
      t.foreign_key :clients
      t.timestamps
    end
  end
end
