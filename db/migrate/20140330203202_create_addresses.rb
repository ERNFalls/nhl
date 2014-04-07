class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address_line_one
      t.string :address_line_two
      t.string :address_line_three
      t.string :city
      t.string :state
      t.integer :zip_code
      t.integer :plus_four_code
      t.string :country
      t.string :address_type
      t.references :addressable, index: true, polymorphic: true
      t.string :addressable_type
      t.timestamps
    end
  end
end
