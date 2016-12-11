class SubjectsController < ApplicationController
  def index
    @subject = subject_params
    @teachers = Teacher.where(subject: subject_params)
  end

  def show
  end

  private
  def subject_params
    params.require(:subject)
  end

end
