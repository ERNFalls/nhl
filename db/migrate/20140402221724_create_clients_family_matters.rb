class CreateClientsFamilyMatters < ActiveRecord::Migration
  def change
    create_table :clients_family_matters, id: false do |t|
      t.references :client, index: true
      t.references :family_matter, index: true
    end
    # add_index :clients_family_matters, [:client_id, :family_matter_id]
  end
end
