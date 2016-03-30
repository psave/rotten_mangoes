class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def restrict_access
    if !current_user
      flash[:alert] = "You must log in."
      redirect_to new_session_path
    end
  end

  def current_user
    @current_user ||=User.find(session[:user_id]) if session[:user_id]
  end

  def is_admin?
    if !(defined?(current_user) && current_user.admin)
      # session[:user_id] = @user.id
      # #need to change to admin home
      # redirect_to admin_users_path, notice: "Hi, #{@user.firstname}!"
      #add redirect with flash notice.
      redirect_to movies_path, notice: "You are being redirected, since you do not have admin priviledges."
    end
  end

  helper_method :current_user

end
