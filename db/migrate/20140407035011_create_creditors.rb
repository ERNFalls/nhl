class CreateCreditors < ActiveRecord::Migration
  def change
    create_table :creditors do |t|
      t.string :creditor
      t.string :account_no
      t.date :date_last_used
      t.decimal :balance, :precision => 10, :scale => 2
      t.string :address_line_one
      t.string :address_line_two
      t.string :address_line_three
      t.string :city
      t.string :state
      t.integer :zip_code
      t.integer :plus_four_code
      t.integer :client_id
      t.foreign_key :clients
      t.timestamps
    end
  end
end
