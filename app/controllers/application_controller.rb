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

  def restrict_admin_access
    if current_user.nil? || !current_user.admin
      # session[:user_id] = @user.id
      # #need to change to admin home
      # redirect_to admin_users_path, notice: "Hi, #{@user.firstname}!"
      #add redirect with flash notice.
      flash[:error] = "You are being redirected, since you do not have admin priviledges."
      redirect_to movies_path
    end
  end

  helper_method :current_user

  def admin?
    current_user && (current_user.admin? || impersonating?)
  end

  def impersonating?
    if session[:actual_user_id].present?
      user = User.find(session[:actual_user_id])
      user.admin?
    else
      false
    end
  end

  helper_method :admin?, :impersonating?

end
