class CreatePipDemands < ActiveRecord::Migration
  def change
    create_table :pip_demands do |t|
      t.date :first_date_of_service
      t.date :final_date_of_service
      t.boolean :demand_sent, :default => false
      t.date :date_demand_sent
      t.boolean :carrier_received, :default => false
      t.date :date_carrier_received
      t.boolean :carrier_responded, :default => false
      t.date :date_of_response
      t.string :certified_mail_no
      t.decimal :postage_cost, :precision => 10, :scale => 2
      t.decimal :total_billed, :precision => 10, :scale => 2
      t.decimal :amount_paid_predemand, :precision => 10, :scale => 2
      t.decimal :deductible, :precision => 10, :scale => 2
      t.string :carrier_response
      t.boolean :include_demand_in_suit, :default => true
      t.integer :pip_matter_id
      t.foreign_key :pip_matters
      t.timestamps
    end
  end
end
