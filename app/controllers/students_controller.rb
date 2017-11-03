class StudentsController < ApplicationController
  # http_basic_authenticate_with name: "admin", password: "unoriginalpassword", only: [:edit]

  before_action :set_student, :authorize, only: [:show, :edit, :update, :destroy, :assign, :unassign]
  before_action :admin, only: [:edit]

  def index
    p "*" * 100
    p flash[:notice]
    redirect_to root_path unless logged_in?
    @students = Student.all
  end

  def show
    respond_to do |format|
      format.html { render 'show' }
      format.js { render 'student_info' }
    end
  end

  def edit
    p "*" * 100
    p session[:admin]
    redirect_to @student unless session[:admin] == true
  end

  def update
    if @student.update(student_params)
      redirect_to @student
    else
      render 'edit'
    end
  end

  def assign
    if @student.teacher_id == nil
      @student.teacher_id = current_user.id
      @student.save
      redirect_to @student
    elsif @student.teacher_id != nil && logged_in?
      flash[:notice] = "This student has already been assigned."
      redirect_to @student
    else
      flash[:notice] = "This page is not available. Please sign in."
      redirect_to root_path
    end
  end

  def unassign
    if @student.teacher_id != nil
      @student.teacher_id = nil
      @student.save
      redirect_to @student
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :grade_level, :gender, :gpa, :detentions, :shirt_size)
  end

  def authorize
    flash[:notice] = "You must be logged in to access this page"
    redirect_back(fallback_location: root_path) if !logged_in?
  end

  def admin
    flash[:notice] = "You do not have administrative privileges"
    redirect_back(fallback_location: root_path) if !session[:admin]
  end

end
