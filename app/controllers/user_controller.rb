class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'Account created!'
    else
      render :new
    end
  end

  def show
    @user=User.find params[:id]
  end

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :confirm_password
    )
  end
end
