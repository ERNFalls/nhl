class PipMatter < ActiveRecord::Base

  belongs_to :case

  has_many :pip_demands, dependent: :destroy
  has_many :pip_checks, dependent: :destroy
 
  accepts_nested_attributes_for :pip_demands, :pip_checks

  validates_presence_of :claimant_last_name
  validates_presence_of :claimant_first_name
  validates_presence_of :medical_provider
  validates_presence_of :insurance_carrier
  validates_presence_of :date_of_loss
  
  searchable do
    text :claimant_last_name, :boost => 6
    text :claimant_first_name, :boost => 6
    text :claimant_middle_name, :boost => 6
    text :medical_provider, :boost => 4
    text :insurance_carrier, :boost => 4
    text :date_of_loss, :boost =>4
  end

  def claimant_name
    "#{claimant_first_name} #{claimant_middle_name} #{claimant_last_name}"
  end

end
