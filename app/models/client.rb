class Client < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, 
  # I removed the following Modules for Clients:
  # devise :database_authenticatable, :recoverable, :registerable, :rememberable, :timeoutable, :trackable, :validatable
  
  has_many :clients_matters, :dependent => :destroy
  accepts_nested_attributes_for :clients_matters
  has_many :matters, :through => :clients_matters
  accepts_nested_attributes_for :matters, :reject_if => lambda { |a| a[:plaintiff, :defendant].blank? }, :allow_destroy => true

  has_many :phone_numbers, :as => :phoneable, :dependent => :destroy
  accepts_nested_attributes_for :phone_numbers, :reject_if => lambda { |a| a[:exchange].blank? }, :allow_destroy => true
  
  has_many :email_addresses, :as => :emailable, :dependent => :destroy
  accepts_nested_attributes_for :email_addresses, :reject_if => lambda { |a| a[:address].blank? }, :allow_destroy => true

  has_many :notes, :as => :noteable, :dependent => :destroy
  accepts_nested_attributes_for :notes, :reject_if => lambda { |a| a[:note].blank? }, :allow_destroy => true

  has_many :tasks, :as => :taskable, :dependent => :destroy
  accepts_nested_attributes_for :tasks, :reject_if => lambda { |a| a[:task].blank? }, :allow_destroy => true

  has_many :bank_accounts, :dependent => :destroy
  has_many :boats, :dependent => :destroy
  has_many :businesses, :dependent => :destroy
  has_many :creditors, :dependent => :destroy
  has_many :dependants, :dependent => :destroy
  has_many :expenses, :dependent => :destroy
  has_many :furnitures, :dependent => :destroy
  has_many :jobs, :dependent => :destroy
  has_many :mortgages, :dependent => :destroy
  has_many :other_cases, :dependent => :destroy
  has_many :properties, :dependent => :destroy
  has_many :property_transfers, :dependent => :destroy
  has_many :vehicles, :dependent => :destroy
  
  accepts_nested_attributes_for :bank_accounts, :boats, :businesses, :creditors,
  :dependants, :expenses, :furnitures, :jobs, :mortgages, :other_cases, :properties,
  :property_transfers, :vehicles
  
  if :company_name.nil? then validates_presence_of :last_name, length: {minimum: 3} end
  
  Roles = [ :admin, :one, :default ]

  def is?( requested_role )
    self.role == requested_role.to_s
  end

  def client_name
    "#{first_name.to_s} #{middle_name.to_s} #{last_name.to_s}"
  end

  def client_filename
    if last_name.present? && first_name.present? && middle_name.present?
      "#{last_name.upcase}, #{first_name.upcase} #{middle_name.upcase} - #{id}"
    elsif last_name.present? && first_name.present?
      "#{last_name.upcase}, #{first_name.upcase} - #{id}"
    elsif last_name.present?
      "#{last_name.upcase} - #{id}"   
    elsif company_name.present?
      "#{company_name.upcase} - #{id}"
    end
  end

  require 'csv'
  require 'date'

  def self.importpd(file)
    CSV.foreach(file.path, headers: true, :encoding => 'ISO-8859-1') do |row|
      c_last_name = row["CON:L_NAME"].sub(" -","").sub(" - ","").sub("(CORP)","").sub("(PI)","").sub("(PIP)","").sub("(FAM)","").sub("(ESTATE)","").sub("(IMM)","").strip
      if row["CON:F_NAME"].blank?
        p_first_name = ""
      else
        p_first_name = ", " + row["CON:F_NAME"].strip
      end
      if row["CON:M_NAME"].blank?
        p_middle_name = ""
      else
        p_middle_name = " " + row["CON:M_NAME"].strip
      end
      if row["CON:Suffix"].blank?
        p_suffix = ""
      else
        p_suffix = " " + row["CON:Suffix"].strip
      end
      cont = where(
	    id: row["CON:CON_ID"],
	    last_name: c_last_name,
        first_name: row["CON:F_NAME"].strip,
        middle_name: row["CON:M_NAME"].strip,
        address_line_one: row["CON:ADDR1"].strip,
        address_line_two: row["CON:ADDR2"].strip,
        city: row["CON:City"].strip,
        state: row["CON:State"].strip,
        zip_code: row["CON:Zip"].strip,
        ssn: row["CON:User1"].strip,
        email: unless row["CON:Email"].blank? then row["CON:Email"].strip else "(PD)" end,
        spouse: row["CON:User2"].strip,
        legacy_pd_email_two: row["CON:URL"].strip,
        legacy_pd_suffix: row["CON:Suffix"].strip,
        legacy_pd_one: row["CON:User3"].strip,
        legacy_pd_two: row["CON:User4"].strip,
        legacy_pd_three: row["CON:User5"].strip,
        legacy_pd_four: row["CON:User6"].strip,
        legacy_pd_file: (c_last_name + p_first_name + p_middle_name + p_suffix).upcase)
      cont.first_or_create!(row.to_hash.slice(:id, :last_name, :first_name,
      :middle_name, :address_line_one, :address_line_two, :city, :state,
      :zip_code, :ssn, :email, :spouse, :legacy_pd_email_two, :legacy_pd_suffix, :legacy_pd_one,
      :legacy_pd_two, :legacy_pd_three, :legacy_pd_four, :legacy_pd_file))
    end
  end

  searchable do
    text :company_name, :boost => 7
	text :last_name, :boost => 6
	text :first_name, :boost => 5
	text :middle_name, :boost => 4
    text :id, :boost => 3
    text :email, :boost => 2
  end

end
