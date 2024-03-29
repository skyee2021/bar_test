class Bar < ApplicationRecord

  # acts_as_paranoid
  # #軟刪除的套件

  
  
  validates :name, presence: true
  belongs_to :user #預測為必填，optional: false
  # belongs_to :user, optional: true
                      #選填
  # def self.available
  #   where(deleted_at: nil)
  # end
  
  #0423看留言
  has_many :comments

  has_many :favorite_bars
  has_many :likers, through: :favorite_bars, source: :user

  def self.deleted
    unscope(:where).where(deleted_at: nil)
    #因為預設是where nil，所以要先拿掉預設才查得到
  end


  scope :available, -> { where(deleted_at: nil)}
  # scope :unavailable, -> { where.not(deleted_at: nil)}
  #      參數一           參數二
  #scope目的是做出一個範圍、篩子
  # lambda, proc => 物件化的block



  def destroy
    #一般使用者
    update(deleted_at: Time.now)
  end

  def real_destroy!
    # 實體方法:給系統管理者使用
    # destroy
    #會呼叫上面的假刪除

    super.destroy
    #呼叫上一層的destroy方法
  end
end
