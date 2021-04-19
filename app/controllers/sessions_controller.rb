class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  
  # def create
  #   email = params[:user][:email]
  #   password = params[:user][:password]
  #   render html: params
  #   # 1 查有無帳號 / 密碼
  #   # 2 轉址 / 重登
  # end

  # def create
  #   email = user_params[:email]
  #   password = user_params[:password]
  #   render html: params
  #   # 1 查有無帳號 / 密碼
  #   # 2 轉址 / 重登
  # end

  def create

    # if User.login(user_params)
    user = User.login(user_params)
    if user
      # 發號碼牌
      # session[:thankyou9527] = user.id
      session[ENV['session_name']] = user.id
      #發號碼牌

      # 轉去首頁
      redirect_to root_path
    else
      redirect_to sign_in_sessions_path
    end
  end
  
  def destroy
      # 撕票
      # session[:thankyou9527] = nil
      session[ENV['session_name']] = nil
  
      # 轉
      redirect_to root_path
  end
  

  private 
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
