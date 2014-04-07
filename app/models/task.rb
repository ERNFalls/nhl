class Task < ActiveRecord::Base
  
  belongs_to :taskable, polymorphic: true

  validates_presence_of :assigned_to
  validates_presence_of :due_date
  validates_presence_of :priority
  validates_presence_of :status
  validates_presence_of :task

  searchable do
    text :due_date, :boost => 6
    text :priority, :boost => 4
    text :status, :boost => 6
    text :assigned_to, :boost => 4
  end

end
