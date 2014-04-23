class CreatePiMatters < ActiveRecord::Migration
  def change
    create_table :pi_matters do |t|
      t.date :date_of_loss
      t.string :accident_type
      t.string :accident_address_line_one
      t.string :accident_address_line_two
      t.string :accident_address_line_three
      t.string :accident_city
      t.string :accident_state
      t.string :accident_country
      t.string :accident_zip_code
      t.string :accident_plus_four_code
      t.string :accident_reporting_agency
      t.string :insurance_carrier
      t.string :insurance_company
      t.string :claim_no
      t.string :policy_no
      t.string :insured_name
      t.string :claims_adjuster
      t.date :first_date_of_policy
      t.date :final_date_of_policy
      t.boolean :personal_injury_protection
      t.decimal :personal_injury_protection_pp_limit, :precision => 10, :scale => 2
      t.boolean :bodily_injury_coverage
      t.decimal :bodily_injury_pp_limit, :precision => 10, :scale => 2
      t.boolean :property_damage_coverage
      t.decimal :property_damage_limit, :precision => 10, :scale => 2
      t.boolean :um_coverage
      t.decimal :um_pp_limit, :precision => 10, :scale => 2
      t.decimal :deductible, :precision => 10, :scale => 2
      t.string :vehicle_make
      t.string :vehicle_model
      t.string :vehicle_year
      t.string :primary_medical_provider
      t.timestamps
      t.integer :matter_id
      t.foreign_key :matters
    end
  end
end
