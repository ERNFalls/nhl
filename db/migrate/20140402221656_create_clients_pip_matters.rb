class CreateClientsPipMatters < ActiveRecord::Migration
  def change
    create_table :clients_pip_matters, id: false do |t|
      t.references :client, index: true
      t.references :pip_matter, index: true
    end
    # add_index :clients_pip_matters, [:client_id, :pip_matter_id]
  end
end
