class CreateClientsImmigrationMatters < ActiveRecord::Migration
  def change
    create_table :clients_immigration_matters, id: false do |t|
      t.references :client, index: true
      t.references :immigration_matter, index: true
    end
    # add_index :clients_immigration_matters, [:client_id, :immigration_matter_id]
  end
end
