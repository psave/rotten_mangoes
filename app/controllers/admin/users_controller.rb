class Admin::UsersController < ApplicationController

  before_action :restrict_admin_access, :except => [:login]

  def login
    @user = User.new
    #@skip_footer = true
  end

  # def new
  #   @user = User.new
  #   render 'users/admin'
  # end

  def new
    @user = User.new
  end

  def index
    @users = User.page(params[:page]).per(10)
  end

  def create
    @user = User.new(user_params)
    @user.save
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
  end

end


