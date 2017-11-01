class SessionsController < ApplicationController
  include SessionsHelper

  # sessions#NEW
  def new

  end

  # sessions#CREATE
  def create
    @teacher = Teacher.find_by(email: session_params[:email])
    if @teacher
      session[:teacher_id] = @teacher.id
      redirect_to root_path
    else
      flash[:notice] = "Invalid email or password"
      redirect_to root_path
    end
  end

  # sessions#DESTROY
  def destroy
    session[:teacher_id] = nil
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
