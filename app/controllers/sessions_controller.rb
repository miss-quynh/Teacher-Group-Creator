class SessionsController < ApplicationController
  include SessionsHelper

  # sessions#CREATE
  def create
    @teacher = Teacher.find_by(email: session_params[:email])
    if @teacher && @teacher.authenticate(session_params[:password])
      session[:teacher_id] = @teacher.id
        if @teacher.email == "asdf@asdf.com"
          session[:admin] = true
        end
      redirect_to root_path, :notice => "Successfully logged in."
    else
      redirect_to root_path, :notice => "Invalid email or password."
    end
  end

  # sessions#DESTROY
  def destroy
    session[:teacher_id] = nil
    session[:admin] = nil
    redirect_to root_path, :notice => "Successfully logged out."
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
