class Vehicle < ActiveRecord::Base

  belongs_to :client

  def vehicle_ymmc
    "#{year} #{make} #{model}"
  end
end
