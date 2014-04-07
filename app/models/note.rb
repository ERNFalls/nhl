class Note < ActiveRecord::Base
  
  belongs_to :noteable, polymorphic: true

  validates_presence_of :user_id
  validates_presence_of :note
  
end
