class CreateClientsForeclosureMatters < ActiveRecord::Migration
  def change
    create_table :clients_foreclosure_matters, id: false do |t|
      t.references :client, index: true
      t.references :foreclosure_matter, index: true
    end
    # add_index :clients_foreclosure_matters, [:client_id, :foreclosure_matter_id]
  end
end
