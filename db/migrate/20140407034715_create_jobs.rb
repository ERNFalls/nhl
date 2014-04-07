class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :employer
      t.string :address_line_one
      t.string :address_line_two
      t.string :address_line_three
      t.string :city
      t.string :state
      t.integer :zip_code
      t.integer :plus_four_code
      t.string :position
      t.string :employment_length
      t.string :payment_cycle
      t.decimal :gross_earnings, :precision => 10, :scale => 2
      t.decimal :net_earnings, :precision => 10, :scale => 2
      t.integer :client_id
      t.foreign_key :clients
      t.timestamps
    end
  end
end
