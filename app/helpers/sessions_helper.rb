module SessionsHelper

  def current_user
    @current_user ||= Teacher.find_by(id: session[:teacher_id]) if session[:teacher_id]
  end

  def logged_in?
    !!current_user
  end

end
