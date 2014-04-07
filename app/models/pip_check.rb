class PipCheck < ActiveRecord::Base

  belongs_to :pip_matter

	def details
		if check_no.present? && total_amount.present?
			"Check No. #{check_no} for $#{total_amount}"
		elsif check_no.nil? && total_amount.present?
			"Check No. --- for $#{total_amount}"
		else
			"Check No. --- for $0.00?"
		end
	end

end
