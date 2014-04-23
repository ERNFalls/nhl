class CreateFurniture < ActiveRecord::Migration
  def change
    create_table :furnitures do |t|
      t.string :item_model
      t.string :description
      t.decimal :price_at_purchase, :precision => 10, :scale => 2
      t.date :date_of_purchase
      t.integer :number_owned, :default => "1"
      t.integer :client_id
      t.foreign_key :clients
      t.timestamps
    end
  end
end
