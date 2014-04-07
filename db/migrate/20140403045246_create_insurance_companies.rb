class CreateInsuranceCompanies < ActiveRecord::Migration
  def change
    create_table :insurance_companies do |t|
      t.string :company_name
      t.string :corporate_rep_last_name
      t.string :corporate_rep_first_name
      t.string :corporate_rep_middle_name
      t.string :corporate_rep_prefix
      t.string :corporate_rep_suffix
      t.string :address_line_one
      t.string :address_line_two
      t.string :address_line_three
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :plus_four_code
      t.string :country
      t.string :area_code
      t.string :exchange
      t.string :suffix
      t.string :extension
      t.string :country_code
      t.string :fax_area_code
      t.string :fax_exchange
      t.string :fax_suffix
      t.string :email_address
      t.integer :insurance_carrier_id
      t.foreign_key :insurance_carriers
      t.timestamps
    end
  end
end
