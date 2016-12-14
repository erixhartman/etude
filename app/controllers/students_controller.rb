class StudentsController < ApplicationController

  def new
    @student = Student.new
  end

  def create

    @user = current_user
    @student = Student.new(
      postal_code: student_params[:postal_code],
      street_address: student_params[:street_address],
      city: student_params[:city],
      'user_id' => @user.id
   )

    if @student.save
      redirect_to root_path
    else
      render "new"
    end

  end
  private

  def student_params
  params.require(:student).permit(:postal_code, :street_address, :city)
  end
end
