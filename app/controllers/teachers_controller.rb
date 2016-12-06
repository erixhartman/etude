class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      redirect_to root_path
    else
      render 'new'
    end

  end

  private

  def teacher_params
    user_id = current_user.id
    params.require(:teacher).permit(:price, :subject, :postal_code, :user_id )
  end

end
