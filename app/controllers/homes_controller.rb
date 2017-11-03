class HomesController < ApplicationController

  def index
    @teacher = Teacher.new
    render :homes
  end

end
