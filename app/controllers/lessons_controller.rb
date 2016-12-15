class LessonsController < ApplicationController

  def new
    @lesson = Lesson.new
    @teacher = Teacher.find(params[:teacher_id])
  end

  def create
    @teacher = Teacher.find(params[:teacher_id])
    @lesson = Lesson.new(
      teacher_id: @teacher.id,
      time: lesson_params[:time],
      format: lesson_params[:format],
      student_id: current_user.student.id
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
    redirect_to user_path
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  private

  def lesson_params
    params.require(:lesson).permit(:time, :format)
  end

end
