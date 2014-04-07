class CreatePipChecks < ActiveRecord::Migration
  def change
    create_table :pip_checks do |t|
      t.string :check_no
      t.date :date_of_issue
      t.decimal :total_amount, :precision => 10, :scale => 2
      t.decimal :benefits, :precision => 10, :scale => 2
      t.decimal :interest, :precision => 10, :scale => 2
      t.decimal :penalty, :precision => 10, :scale => 2
      t.decimal :postage, :precision => 10, :scale => 2
      t.decimal :attorneys_fees, :precision => 10, :scale => 2
      t.string :purpose_of_check
      t.boolean :include_check_in_suit
      t.string :status
      t.integer :pip_matter_id
      t.foreign_key :pip_matters
      t.timestamps
    end
  end
end
