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
      t.string :plaintiff
      t.string :defendant
      t.boolean :side
      t.string :case_state
      t.string :case_county
      t.integer :case_year
      t.integer :case_sequence
      t.string :case_code
      t.integer :case_location
      t.integer :judicial_section
      t.string :judge
      t.string :opposing_counsel
      t.date :date_suit_filed
      t.date :date_of_sop
      t.datetime :initial_court_date
      t.string :status
      t.date :closing_date
      t.timestamps
    end
  end
end
