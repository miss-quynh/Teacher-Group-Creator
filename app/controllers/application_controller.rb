class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def current_user
    @current_user ||= Teacher.find_by(id: session[:teacher_id]) if session[:teacher_id]
  end


  def logged_in?
    !!current_user
  end

  helper_method :current_user, :logged_in?
end
