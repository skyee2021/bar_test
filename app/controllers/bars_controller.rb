class BarsController < ApplicationController
  before_action :find_bar, only: [:show, :edit, :update, :destroy]

  before_action :check_user!, except: [:index, :show]

  

  def index
    # @bars = Bar.new
    # @bars = Bar.available
    @bars = Bar.all
  end

  def show
    @bar = Bar.find(params[:id])
    #做出留言(0423)
    # @comment = Comment.new
    # @comment1 = Comment.new #全新留言
    # @comment2 = @bar.comments.new #在指定餐廳下留言
    @comment = @bar.comments.new
    @comments = @bar.comments.order(id: :desc) #該餐廳的留言(排序是最新的在上面)
    #變數取名叫comments以示區別（複數的留言）
  end

  def pocket_list
    @bar = Bar.find(params[:id])

    if(current_user.pocket_list.exists?(@bar.id)) 
      # if current_user.like?
      #已在名單中，移除（按讚再按一次移除）
      current_user.pocket_list.destroy(@bar)
      render json: {id: @bar.id, status: 'removed'}
    else
      current_user.pocket_list << @bar #餐廳找到後放入口袋名單
      render json: {id: @bar.id, status: 'added'}
    end
    
    # current_user.pocket_list = [@bar] #等同上面，可以寫多個，上面只能寫一個
    # render html: params
    # render json: params
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
    @bar =Bar.new
  end
# ============
  def create
    # @bars =Bar.new(bars_params)
    # @restaurant = Restaurant.new(restaurant_params)
    # @restaurant.user_id = current_user.id
    # @restaurant.user = current_user
    @bar = current_user.bars.new(bars_params)

    if @bar.save
      redirect_to bars_path, notice: "新增成功"
    else
      render :new
    end
  end

  def edit
    # @bar = Bar.find_by(id: params[:id])
  end

  def update
    # @bar = Bar.find_by(id: params[:id])
    # byebug
    if @bar.update(bars_params)
      redirect_to bars_path, notice: "更新成功"
    else
      render :edit
    end
  end

  def destroy
    # @bar = Bar.find_by(id: params[:id])
    # # @bar.destroy if @bar  #真刪除
    # # @bar.update(deleted_at: Time.now) #假刪除
    # @bar.destroy if @bar
    # #在上層定義一個destroy假刪除
    # redirect_to bars_path, notice: "已刪除"
    @bar.destroy
    redirect_to bars_path
  end
  
  private

  # def find_bar
  #   # @bar = Bar.find(params[:id])
  #   @bar = Bar.find_by!(
  #     id: params[:id],
  #     user_id: current_user.id
  #   )
  # end

  def find_bar
    # @restaurant = Restaurant.find(params[:id])
    # 1
    # @restaurant = Restaurant.find_by!(
    #   id: params[:id],
    #   user_id: current_user.id
    # )

    # 2
    @bar = current_user.bars.find(params[:id])
  end

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
