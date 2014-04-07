class Ability < ActiveRecord::Base
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
	if user.is? :admin
	  can :manage, :all
	elsif user.is? :one
	  can :read, :all
	  can :update, User, :id => user.id
	  can :create, Contact
	  can :update, Contact
	  can :create, Note
	  can :update, Note, :user_id => user.id
	  can :destroy, Note, :user_id => user.id
	  can :create, Task
	  can :update, Task, :user_id => user.id
	  can :update, Task, :assigned_to => user.id
	  can :destroy, Task, :user_id => user.id
	  can :create, Template
	  can :update, Template, :user_id => user.id
	  can :destroy, Template, :user_id => user.id
    else
	end
  end
end

