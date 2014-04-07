class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, 
  # I removed the following Modules for Users on 1/22/14:
  # :recoverable
  
  has_many :templates
  
  has_many :notes, :as => :notable, :dependent => :destroy
  
  has_many :tasks, :as => :taskable, :dependent => :destroy
  
  has_many :phone_numbers, :as => :phoneable, :dependent => :destroy
  accepts_nested_attributes_for :phone_numbers, :reject_if => lambda { |a| a[:exchange].blank? }, :allow_destroy => true
  
  has_many :email_addresses, :as => :emailable, :dependent => :destroy
  accepts_nested_attributes_for :email_addresses, :reject_if => lambda { |a| a[:address].blank? }, :allow_destroy => true
  
  has_many :addresses, :as => :addressable, :dependent => :destroy
  accepts_nested_attributes_for :addresses, :reject_if => lambda { |a| a[:address_line_one].blank? }, :allow_destroy => true
  
  validates_presence_of :username
  
  Roles = [ :admin, :one, :default ]
  
  mount_uploader :avatar, AvatarUploader

  def is?( requested_role )
    self.role == requested_role.to_s
  end

  devise :database_authenticatable, :registerable, :rememberable, :timeoutable, :trackable, :validatable

  searchable do
	text :last_name, :boost => 6
	text :first_name, :boost => 4
	text :middle_name, :boost => 2
    text :username, :boost => 6
    text :email, :boost => 2
    text :role, :boost => 2
  end

end
