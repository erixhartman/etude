class TeachersController < ApplicationController
  def index
    @eric = User.find_by(last_name: "Hartman").teacher
    @teachers = Teacher.all
    @teachersfeat = Teacher.order(teaching_since: :asc).take(5)
    @teachersnew = Teacher.order(teaching_since: :desc).take(5)
    @subjects = @teachers.select("subject").group("subject")
  end

  def new
    @teacher = Teacher.new
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def create
    @user = current_user
    @teacher = Teacher.new(
      price: teacher_params[:price],
      subject: teacher_params[:subject],
      postal_code: teacher_params[:postal_code],
      bio: teacher_params[:bio],
      picture: teacher_params[:picture],
      teaching_since: teacher_params[:teaching_since],
      street_address: teacher_params[:street_address],
      city: teacher_params[:city],
      province: teacher_params[:province],
      'user_id' => @user.id
    )

    if @teacher.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @teacher = Teacher.find_by(user_id: params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update_attributes(teacher_params)
      redirect_to user_path
    else
      render edit_teacher_path
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:price, :subject, :postal_code, :bio, :picture, :teaching_since, :street_address, :city, :province)
  end

end
