class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.boolean :keep, :default => false
      t.string :ownership_type
      t.integer :year
      t.string :make
      t.string :model
      t.string :color
      t.string :vin_no
      t.string :current_mileage
      t.string :bank
      t.string :account_no
      t.decimal :balance_owed, :precision => 10, :scale => 2
      t.integer :client_id
      t.foreign_key :clients
      t.timestamps
    end
  end
end
