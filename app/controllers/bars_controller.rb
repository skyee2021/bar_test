class BarsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]

  before_action :check_user!, except: [:index, :show]

  def index
    # @bars = Bar.new
    @bars = Bar.available
  end

  # def new
  #   @bars =Bar.new
  # end
# =======0419
  # def new
  #   if user_signed_in?
  #     @bar = Bar.new
  #   else
  #     redirect_to root_path
  #   end
  # end

  def new
    @bars =Bar.new
  end
# ============
  def create
    @bars =Bar.new(bars_params)

    if @bars.save
      redirect_to bars_path, notice: "新增成功"
    else
      render :new
    end
  end

  def edit
    @bar = Bar.find_by(id: params[:id])
  end

  def update
    @bar = Bar.find_by(id: params[:id])
    # byebug
    if @bar.update(bars_params)
      redirect_to bars_path, notice: "更新成功"
    else
      render :edit
    end
  end

  def destroy
    @bar = Bar.find_by(id: params[:id])
    # @bar.destroy if @bar  #真刪除
    # @bar.update(deleted_at: Time.now) #假刪除
    @bar.destroy if @bar
    #在上層定義一個destroy假刪除
    redirect_to bars_path, notice: "已刪除"
  end
  
  private
  def bars_params
    params.require(:bar).permit(:name, :tel, :address)
  end

  # =======0419  抬到上層

  # def current_user
  #   User.find_by(id: session[ENV['session_name']])
  # end

  # def user_signed_in?
  #   if session[ENV['session_name']]
  #     return true
  #   else
  #     return false
  #   end
  # end

  # def check_user!
  #   redirect_to root_path if not user_signed_in?
  #   #未登入就去首頁
  # end

end
