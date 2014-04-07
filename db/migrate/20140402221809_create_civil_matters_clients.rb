class CreateCivilMattersClients < ActiveRecord::Migration
  def change
    create_table :civil_matters_clients, id: false do |t|
      t.references :client, index: true
      t.references :civil_matter, index: true
    end
    # add_index :civil_matters_clients, [:client_id, :civil_matter_id]
  end
end
