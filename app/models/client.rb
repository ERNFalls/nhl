class Client < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, 
  # I removed the following Modules for Clients:
  # devise :database_authenticatable, :recoverable, :registerable, :rememberable, :timeoutable, :trackable, :validatable
  
  has_many :phone_numbers, :as => :phoneable, :dependent => :destroy
  accepts_nested_attributes_for :phone_numbers, :reject_if => lambda { |a| a[:exchange].blank? }, :allow_destroy => true
  
  has_many :email_addresses, :as => :emailable, :dependent => :destroy
  accepts_nested_attributes_for :email_addresses, :reject_if => lambda { |a| a[:address].blank? }, :allow_destroy => true
  
  has_many :addresses, :as => :addressable, :dependent => :destroy
  accepts_nested_attributes_for :addresses, :reject_if => lambda { |a| a[:address_line_one].blank? }, :allow_destroy => true
  
  if :company_name.nil? then validates_presence_of :last_name, length: {minimum: 3} end
  
  Roles = [ :admin, :one, :default ]

  def is?( requested_role )
    self.role == requested_role.to_s
  end
  
  require 'csv'
  require 'date'

  def self.importpd(file)
    CSV.foreach(file.path, headers: true, :encoding => 'ISO-8859-1') do |row|
      cont = where(id: row["CON:CON_ID"], last_name: row["CON:L_NAME"].strip,
      first_name: row["CON:F_NAME"].strip, middle_name: row["CON:M_NAME"].strip, client: "1")
      cont.first_or_create!(row.to_hash.slice(:id, :last_name, :first_name, :middle_name))
    end
  end

  searchable do
    text :company_name, :boost => 6
	text :last_name, :boost => 6
	text :first_name, :boost => 4
	text :middle_name, :boost => 2
    text :email, :boost => 2
  end

end
