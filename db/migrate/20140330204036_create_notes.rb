class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :note
      t.references :user, index: true
      t.references :noteable, index: true, polymorphic: true
      t.string :noteable_type
      t.timestamps
    end
  end
end
