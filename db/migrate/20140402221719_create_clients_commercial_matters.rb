class CreateClientsCommercialMatters < ActiveRecord::Migration
  def change
    create_table :clients_commercial_matters, id: false do |t|
      t.references :client, index: true
      t.references :commercial_matter, index: true
    end
    # add_index :clients_commercial_matters, [:client_id, :commercial_matter_id]
  end
end
