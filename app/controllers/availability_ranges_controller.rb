class AvailabilityRangesController < ApplicationController
  def new
    @availability_range = AvailabilityRange.new
    @teacher = Teacher.find(params[:teacher_id])
  end

  def create
    @user = current_user
    @teacher = Teacher.find_by(user_id: @user.id)
    @availability_range = AvailabilityRange.new(
      weekday: availability_range_params[:weekday],
      start_time: availability_range_params[:start_time],
      end_time: availability_range_params[:end_time],
      teacher_id: @teacher.id
    )
  end

  def edit
  end

  def update
  end

  private
  def availability_range_params
    params.require(:availability_range).permit(:weekday, :start_time, :end_time)
  end
end
