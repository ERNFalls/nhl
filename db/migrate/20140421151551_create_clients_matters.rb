class CreateClientsMatters < ActiveRecord::Migration
  def change
    create_table :clients_matters do |t|
      t.timestamps
      t.integer :client_id
      t.integer :matter_id
      t.foreign_key :clients
      t.foreign_key :matters
    end
    add_index :clients_matters, [:client_id, :matter_id], :unique => true
  end
end
