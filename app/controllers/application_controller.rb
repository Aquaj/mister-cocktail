class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    if (session[:user_id] && !(User.all.map(&:id).find(session[:user_id])))
      session[:user_id] = nil
    end
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def user_signed_in?
    !current_user.nil?
  end
  helper_method :user_signed_in?

  def restrict_access
    unless user_signed_in?
      render html: "<strong>Not Found</strong>".html_safe
    end
  end

  def authorize
    redirect_to '/login' unless current_user
  end
end
