class InsuranceCarrier < ActiveRecord::Base

  has_many :insurance_companies, dependent: :destroy
  accepts_nested_attributes_for :insurance_companies

  validates :company_name, presence: true

  searchable do
    text :company_name, :boost => 6
  end

end
