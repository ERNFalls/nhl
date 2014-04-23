class ClientsMatter < ActiveRecord::Base

  belongs_to :client
  belongs_to :matter

end

