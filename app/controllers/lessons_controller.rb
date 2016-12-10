class LessonsController < ApplicationController

  def new
    @lesson = Lesson.new
    @teacher = Teacher.find(params[:teacher_id])
  end

  def create
    @user = current_user
    @student = Student.find_by(user_id: @user.id)
    @teacher = Teacher.find(params[:teacher_id])
    @lesson = Lesson.new(
      teacher_id: @teacher.id,
      time: lesson_params[:time],
      student_id: @student.id
    )

    if @lesson.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to root_path
    #TODO redirect_to a user profile page rather than root?
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  private

  def lesson_params
    params.require(:lesson).permit(:time)
  end


end
