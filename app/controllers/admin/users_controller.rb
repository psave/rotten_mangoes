class Admin::UsersController < ApplicationController

  before_action :restrict_admin_access, :except => [:login]

  # def login
  #   @user = User.new
  #   #@skip_footer = true
  # end

  # def new
  #   @user = User.new
  #   render 'users/admin'
  # end
  def index
    # @users = User.page(params[:page]).per(9)
    @users = User.filter(params[:type], params[:search]).page(params[:page]).per(9)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: "#{@user.full_name} created successfully."
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  def impersonate
    @user = User.find(params[:id])
    session[:actual_user_id] = session[:user_id]
    session[:user_id] = @user.id
    redirect_to movies_path
  end

  private 

  def only_admins
    redirect_to(root_path) unless admin?
  end

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end

end


