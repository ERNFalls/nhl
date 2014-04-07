class CreateClientsModificationMatters < ActiveRecord::Migration
  def change
    create_table :clients_modification_matters, id: false do |t|
      t.references :client, index: true
      t.references :modification_matter, index: true
    end
    # add_index :clients_modification_matters, [:client_id, :modification_matter_id]
  end
end
