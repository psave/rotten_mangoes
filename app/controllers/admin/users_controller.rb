class Admin::UsersController < ApplicationController

  before_filter :is_admin?

  def index 
    @user = User.new
    @skip_footer = true
  end

  # def new
  #   @user = User.new
  #   render 'users/admin'
  # end

  def is_admin?

  end

  protected

  def user_params
    params.require(:user).permit(:email, :password)
  end

end


