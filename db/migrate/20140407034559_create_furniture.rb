class CreateFurniture < ActiveRecord::Migration
  def change
    create_table :furnitures do |t|
      t.string :item_model
      t.string :description
      t.decimal :price_at_purchase, :precision => 10, :scale => 2
      t.date :date_of_purchase
      t.string :number_owned
      t.integer :client_id
      t.foreign_key :clients
      t.timestamps
    end
  end
end
