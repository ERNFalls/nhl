class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task
      t.string :priority
      t.string :status
      t.datetime :due_date
      t.references :taskable, index: true, polymorphic: true
      t.string :taskable_type
      t.integer :created_by, index: true
      t.integer :assigned_to, index: true
      t.timestamps
    end
  end
end
