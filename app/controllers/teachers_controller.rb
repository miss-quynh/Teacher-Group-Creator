class TeachersController < ApplicationController
  include SessionsHelper

  # teachers#INDEX
  def index
    @teachers = Teacher.all
    render :"teachers/index"
  end

  # teachers#SHOW
  def show
    @teacher = Teacher.find(params[:id])
  end

  # teachers#NEW
  def new
    @teacher = Teacher.new
  end

  # teachers#CREATE
  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      session[:teacher_id] = @teacher.id
      redirect_to root_path
    else
      @errors = @teacher.errors.full_messages
      render :"teachers/new"
    end
  end


  private

  def teacher_params
    params.require(:teacher).permit(:full_name, :email, :password)
  end

end
