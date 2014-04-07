class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.integer :country_code
      t.integer :area_code
      t.integer :exchange
      t.integer :suffix
      t.integer :extension
      t.string :phone_number_type
      t.references :phoneable, index: true, polymorphic: true
      t.string :phoneable_type
      t.timestamps
    end
  end
end
