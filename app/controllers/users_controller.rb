class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    if current_user
      if current_user.teacher
        @teacher = Teacher.find_by(user_id: current_user.id)
        @availability_ranges = @teacher.availability_ranges.sort { |a,b| a.weekday <=> b.weekday }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
