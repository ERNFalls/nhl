class CreatePipMatters < ActiveRecord::Migration
  def change
    create_table :pip_matters do |t|
      t.date :date_of_loss
      t.string :medical_provider
      t.string :claimant_last_name
      t.string :claimant_first_name
      t.string :claimant_middle_name
      t.string :claimant_prefix
      t.string :claimant_suffix
      t.string :insurance_carrier
      t.string :insurance_company
      t.string :claim_no
      t.string :policy_no
      t.string :insured_name
      t.string :claims_adjuster
      t.date :first_date_of_policy
      t.date :final_date_of_policy
      t.timestamps
      t.integer :matter_id
      t.foreign_key :matters
    end
  end
end
