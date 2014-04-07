class CreateBankruptcyMattersClients < ActiveRecord::Migration
  def change
    create_table :bankruptcy_matters_clients, id: false do |t|
      t.integer :chapter
      t.string :bankruptcy_type
      t.references :client, index: true
      t.references :bankruptcy_matter, index: true
    end
    # add_index :bankruptcy_matters_clients, [:client_id, :bankruptcy_matter_id]
  end
end
