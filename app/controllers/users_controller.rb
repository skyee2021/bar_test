class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    # if user_params[:password] == user_params[:password_confirmation]

    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def like?(b)
    # if pocket_list.exist?(b.id)
    #   return true
    # else
    #   return false
    # end
    pocket_list.exist?(b.id)
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
