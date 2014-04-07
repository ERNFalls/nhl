class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :company_name
      t.string :business_description
      t.date :business_start_date
      t.boolean :active
      t.string :assets
      t.string :address_line_one
      t.string :address_line_two
      t.string :address_line_three
      t.string :city
      t.string :state
      t.integer :zip_code
      t.integer :plus_four_code
      t.integer :client_id
      t.foreign_key :clients
      t.timestamps
    end
  end
end
