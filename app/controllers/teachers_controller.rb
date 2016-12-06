class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @user = current_user
    @teacher = Teacher.new(
      price: :price,
      subject: :subject,
      postal_code: :postal_code,
      'user_id' => @user.id
    )

    if @teacher.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:price, :subject, :postal_code)
  end

end
