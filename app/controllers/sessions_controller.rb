class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.admin
        redirect_to admin_users_path
      else
        redirect_to movies_path, notice: "Welcome back, #{user.firstname}!"
      end
    else
      flash.now[:alert] = "Email does not exist. Please create a new account."
      render :new
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to movies_path, notice: "Adios!"
  end

end
