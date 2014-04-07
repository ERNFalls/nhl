class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :expense_type
      t.decimal :expense, :precision => 10, :scale => 2
      t.integer :client_id
      t.foreign_key :clients
      t.timestamps
    end
  end
end
