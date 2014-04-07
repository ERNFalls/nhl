class CreateForeclosureMatters < ActiveRecord::Migration
  def change
    create_table :foreclosure_matters do |t|
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
