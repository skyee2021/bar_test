class BarsController < ApplicationController

  def index
    # @bars = Bar.new
    @bars = Bar.available
  end

  def new
    @bars =Bar.new
  end

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

end
