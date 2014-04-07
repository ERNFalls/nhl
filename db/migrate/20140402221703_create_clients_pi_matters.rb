class CreateClientsPiMatters < ActiveRecord::Migration
  def change
    create_table :clients_pi_matters, id: false do |t|
      t.references :client, index: true
      t.references :pi_matter, index: true
    end
    # add_index :clients_pi_matters, [:client_id, :pi_matter_id]
  end
end
