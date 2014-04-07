class Template < ActiveRecord::Base

  mount_uploader :file, TemplateUploader
  
  validates_presence_of :name
  validates_presence_of :template_type
  
  searchable do
    text :name, :boost => 6
    text :template_type, :boost => 4
    text :user_id, :boost => 2
  end
 
end
