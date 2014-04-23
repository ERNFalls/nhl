class Matter < ActiveRecord::Base

  include Filesystem

  has_many :clients_matters, :dependent => :destroy
  accepts_nested_attributes_for :clients_matters
  has_many :clients, :through => :clients_matters
  accepts_nested_attributes_for :clients

  has_many :notes, :as => :noteable, :dependent => :destroy
  accepts_nested_attributes_for :notes, :reject_if => lambda { |a| a[:note].blank? }, :allow_destroy => true
  
  has_many :tasks, :as => :taskable, :dependent => :destroy
  accepts_nested_attributes_for :tasks, :reject_if => lambda { |a| a[:task].blank? }, :allow_destroy => true
  
  validates_presence_of :plaintiff, :length => { :minimum => 5}
  validates_presence_of :defendant, :length => { :minimum => 5}

  searchable do
    text :plaintiff, :boost => 8
    text :defendant, :boost => 6
    text :case_no, :boost => 4
  end

  def case_simple_style
    if plaintiff.length > 20 && defendant.length > 20
      "#{plaintiff.first(20)}... vs. #{defendant.first(20)}..."
    elsif plaintiff.length > 20 && defendant.length <= 20
      "#{plaintiff.first(20)}... vs. #{defendant}"
    elsif plaintiff.length <= 20 && defendant.length > 20
      "#{plaintiff} vs. #{defendant.first(20)}..."
    elsif plaintiff.length <= 20 && defendant.length <= 20
      "#{plaintiff} vs. #{defendant}"
    end
  end

  def case_style
    "#{plaintiff}, Plaintiff, vs. #{defendant}, Defendant."
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
