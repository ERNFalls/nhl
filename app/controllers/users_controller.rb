class UsersController < ApplicationController

  layout "main"

  load_and_authorize_resource

  def show
	@user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
	  render "new"
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    if @user.update(user_params)
      redirect_to @user
      sign_in(@user, :bypass => true) if @user == current_user
    else
      render "edit"
    end
  end
  
  def index
    if params[:limit]
      @search = User.search do
        fulltext params[:search]
        paginate :page => params[:page], :per_page => params[:limit]
      end
      @users = @search.results
      if params[:search] != ""
        flash[:alert] = "Found " << @users.total_entries.to_s << " Matches."
        flash.discard
      end
    else
      @search = User.search do
        fulltext params[:search]
        paginate :page => params[:page], :per_page => 10
      end
      @users = @search.results
      flash.discard
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

private
  def user_params
    params.require(:user).permit(:id, :email, :username, :role, :last_name,
    :first_name, :middle_name, :prefix, :suffix, :company_name,
    :encrypted_password, :password, :password_confirmation,
	:reset_password_token, :reset_password_sent_at, :remember_created_at,
	:sign_in_count, :current_sign_in_at, :last_sign_in_at,
    :current_sign_in_ip, :last_sign_in_ip, :avatar,
    phone_numbers_attributes: [:id, :number_type, :country_code,
    :area_code, :exchange, :suffix, :extension,
    :created_at, :updated_at], email_addresses_attributes: [:id,
    :address, :address_type, :description, :created_at, :updated_at],
    addresses_attributes: [:id, :address_line_one, :address_line_two, :address_line_three, :city,
    :state, :zip_code, :plus_four_code, :country, :address_type, :created_at, :updated_at])
  end
end
