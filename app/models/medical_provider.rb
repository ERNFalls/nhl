class MedicalProvider < ActiveRecord::Base

  validates_presence_of :company_name

  searchable do
    text :company_name, :boost => 6
  end

end
