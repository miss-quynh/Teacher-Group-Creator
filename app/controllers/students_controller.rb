class StudentsController < ApplicationController

  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all

    respond_to do |format|
      format.html { render :index }
    end
  end

  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @student }
    end
  end

  def edit

  end

  private

  def set_student
    @student = Student.find(params[:id])
  end


end
