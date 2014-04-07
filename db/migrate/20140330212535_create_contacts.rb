class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.string :prefix
      t.string :suffix
      t.string :company_name
      t.string :contact_type
      t.timestamps
    end
  end
end
