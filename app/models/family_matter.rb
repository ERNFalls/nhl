class FamilyMatter < ActiveRecord::Base

  include Filesystem

  has_and_belongs_to_many :clients
  
  has_many :notes, :as => :noteable, :dependent => :destroy
  accepts_nested_attributes_for :notes, :reject_if => lambda { |a| a[:note].blank? }, :allow_destroy => true
  
  has_many :tasks, :as => :taskable, :dependent => :destroy
  accepts_nested_attributes_for :tasks, :reject_if => lambda { |a| a[:task].blank? }, :allow_destroy => true
  
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

  def case_no
    unless judicial_section.blank?
      if judicial_section < 10
        "#{case_year}-#{case_sequence} #{case_code} #{case_location} (0#{judicial_section})"
      else
        "#{case_year}-#{case_sequence} #{case_code} #{case_location} (#{judicial_section})"
      end
    else
      "#{case_year}-#{case_sequence} #{case_code} #{case_location}"
    end
  end

end
