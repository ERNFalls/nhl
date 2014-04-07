class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :name
      t.string :file
      t.string :template_type
      t.boolean :private
      t.integer :user_id
      t.foreign_key :users
      t.timestamps
    end
  end
end
