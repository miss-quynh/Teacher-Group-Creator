class StudentsController < ApplicationController

  before_action :set_student, only: [:show, :edit, :update, :destroy, :assign]

  def index
    @students = Student.all

  end

  def show

  end

  def edit
  end

  def update

  end

  def assign
    if @student.teacher_id == nil
      @student.teacher_id = current_user.id
      @student.save
      redirect_to @student
    else
      flash[:notice] = "This student has already been assigned."
      redirect_to @student
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :grade_level, :gender, :gpa)
  end


end
