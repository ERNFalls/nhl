class CreateClientsCriminalMatters < ActiveRecord::Migration
  def change
    create_table :clients_criminal_matters, id: false do |t|
      t.references :client, index: true
      t.references :criminal_matter, index: true
    end
    # add_index :clients_criminal_matters, [:client_id, :criminal_matter_id]
  end
end
