class Admin::UsersController < ApplicationController

  before_action :is_admin?, :except => [:login]

  def login
    @user = User.new
    @skip_footer = true
  end

  # def new
  #   @user = User.new
  #   render 'users/admin'
  # end

  def index
  end



  protected

  def user_params
    params.require(:user).permit(:email, :password)
  end

end


