class CommentsController < ApplicationController
  before_action :check_user!#未登入就踢走(做在上層)

  def create
    @bar = Bar.find(params[:bar_id]) #先找出餐廳
    @comment = @bar.comments.new(comment_params) #找出餐廳後做出新留言
    # @comment.user = current_user #留言的就是現在的使用者
                                # 往下搬到private:comment_params

    if @comment.save 
      # redirect_to bar_path(@bar)
      # redirect_to @bar  # 餐廳的show(只有show才有的簡寫)
      
      #沒東西的話會找同名的view
      #rails特殊功能
    else
      render 'bars/show'
    end

    # render html: params #我只要查詢，直接拿整包出來
  end

  def destroy
  end

  private 
  def comment_params #清洗資料包
    # params.require(:comment).permit(:content)
    # #create的user往下搬
    # permited_params[:user] = current_user
    # return permited_params

    #利用merge方法把上面寫成一行（merge可以把user加入hash中
    params.require(:comment).permit(:content)
                            .merge({user: current_user})

  end

end

