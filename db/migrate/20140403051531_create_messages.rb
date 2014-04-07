class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :message
      t.references :messageable, index: true, polymorphic: true
      t.string :messageable_type
      t.timestamps
    end
  end
end
