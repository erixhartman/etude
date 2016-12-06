class LessonsController < ApplicationController

  def new
    @lesson = Lessson.new
  end

  def create
    @user = current_user
    @student = @user.student.id
    @lesson = @teacher.Lesson.new(
      teacher_id: @teacher.id,
      time: lesson_params[:time],
      student_id: @student
    )
    if @lesson.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit(:time)
  end


end
