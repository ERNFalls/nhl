class CreateEmailAddresses < ActiveRecord::Migration
  def change
    create_table :email_addresses do |t|
      t.string :address
      t.string :address_type
      t.references :emailable, index: true, polymorphic: true
      t.string :emailable_type
      t.timestamps
    end
  end
end
