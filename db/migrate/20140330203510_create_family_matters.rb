class CreateFamilyMatters < ActiveRecord::Migration
  def change
    create_table :family_matters do |t|
      t.timestamps
      t.integer :matter_id
      t.foreign_key :matters
    end
  end
end
