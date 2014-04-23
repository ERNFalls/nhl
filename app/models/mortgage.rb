class Mortgage < ActiveRecord::Base

  belongs_to :client
  
  def property_address
    "#{address_line_one}, #{city}, #{state} #{zip_code}"
  end

end
