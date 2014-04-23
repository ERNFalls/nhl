class PipDemand < ActiveRecord::Base

  belongs_to :pip_matter

  def d_o_s
    if first_date_of_service.present? && final_date_of_service.present?
	  "DoS: #{first_date_of_service.strftime("%m-%d-%Y")} through #{final_date_of_service.strftime("%m-%d-%Y")}"
    elsif first_date_of_service.present? && final_date_of_service.nil?
	  "DoS: #{first_date_of_service.strftime("%m-%d-%Y")}"
	else
	  "DoS: Blank (Demand No.: #{id})"
	end
  end

end
