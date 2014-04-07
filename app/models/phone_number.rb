class PhoneNumber < ActiveRecord::Base
  
  belongs_to :phoneable, polymorphic: true

  def full_phone_number
    "(#{area_code}) #{exchange}-#{suffix}"
  end

end
