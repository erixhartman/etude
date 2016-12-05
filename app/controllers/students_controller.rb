class StudentsController < ApplicationController

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(:user_id => current_user.id)

    if @student.save
      redirect_to root_path
    else
      redirect_to root_path
    end

  end

end
