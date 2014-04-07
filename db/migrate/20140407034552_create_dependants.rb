class CreateDependants < ActiveRecord::Migration
  def change
    create_table :dependants do |t|
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.string :prefix
      t.string :suffix
      t.string :ssn
      t.date :date_of_birth
      t.string :relationship
      t.string :employment
      t.integer :client_id
      t.foreign_key :clients
      t.timestamps
    end
  end
end
