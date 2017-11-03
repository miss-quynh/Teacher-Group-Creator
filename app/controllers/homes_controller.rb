class HomesController < ApplicationController

  def index
    p flash
    @teacher = Teacher.new
    render :homes
  end

end
