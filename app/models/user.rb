module Hasher
  require 'digest'
  def self.encrypt(password)
    Digest::SHA1.hexdigest(password)
  end

  # def self.salted(password)
  #   "123#{password}xx"
  # end

  def self.salted(password, head = "123", tail = "xx")
    "#{head}#{password}#{tail}"
  end
end

# ==============因為下面搬到模組所以呼叫要改為呼叫模組
# def self.login(params)
#   email = params[:email]
#   password = params[:password]

#   salted_password = Hasher.salted(password)
#   encrypted_password = Hasher.encrypted(salted_password)

#   find_by(email: email, password: encrypted_password)
# end
# ==============因為下面搬到模組所以呼叫要改為呼叫模組
# private
# def encrypt_password
#   salted_pwd = Hasher.salted(password)
#   self.password = Hasher.encrypt(salted_pwd)
# end
# ==============因為下面搬到模組所以呼叫要改為呼叫模組

# ================================================================

class User < ApplicationRecord

  validates :email, presence: true,
                    uniqueness: true, #驗證是不是唯一值
                    format: { with: /.+\@.+\..+/ } #正規表達法
  validates :password, presence: true,
                       confirmation: true

#在建立資料save前做驗證
before_create :encrypt_password

# =0419關聯============================0426==========================
# has_many :bars  透過第三方表格換成下面favorite_bars
has_many :favorite_bars
has_many :bars #owener
# has_many :bars, through: :favorite_bars
# has_many :hellos, class_name: 'FavoriteBar'  #定義一個方法表格
# has_many :favorite_bars, through: :hellos, 
#                          source: :bar
has_many :pocket_list, through: :favorite_bars, source: :bar
          #取名表格，透過favorite表格，來源是bar資料庫
has_many :comments

# ==============因為下面搬到模組所以呼叫要改為呼叫模組
def self.login(params)
  email = params[:email]
  password = params[:password]

  salted_password = Hasher.salted(password)
  encrypted_password = Hasher.encrypt(salted_password)

  find_by(email: email, password: encrypted_password)
end
# ==============因為下面搬到模組所以呼叫要改為呼叫模組
# def self.login(params)
#   #類別方法
#   email = params[:email]
#   password = params[:password]

#   salted_password = salted(password)
#   #在拆一個變數
#   encrypted_password = encrypted(salted_password)
#                                   #加料密碼

#   find_by(email: email, password: encrypted_password)
#                                   #密碼已加密
# end
# ==============因為下面搬到模組所以呼叫要改為呼叫模組


private
def encrypt_password
  salted_pwd = Hasher.salted(password)
  self.password = Hasher.encrypt(salted_pwd)
end
# ==============因為下面搬到模組所以呼叫要改為呼叫模組
# private
# def encrypt_password
#   #加密
#   require 'digest'
#   salted_pwd = salted(password)
#   # self.password = encrypt(salted_pwd)
#   # self.password = Digest::SHA1.hexdigest(self.password)
#   #類別方法                               #物件的password欄位(1234)：user.password實體方法
#   # self.password=(Digest::SHA1.hexdigest(password))
#   # password = Digest::SHA1.hexdigzest(password)
#   # ＝＝＝＝＝＝＝＝＝
#   # self.password = Digest::SHA1.hexdigest(salted(password))
#   #這段到下面「encrypt(password)」方法中
#   self.password = encrypt(salted_pwd)
# end
# ==============因為下面搬到模組所以呼叫要改為呼叫模組


# ＝＝＝＝＝＝＝往上搬倒模組Hasher
# def encrypt(password)
#   Digest::SHA1.hexdigest(password)
# end

# def salted(password)
#   "123#{password}xx"
# end
# ＝＝＝＝＝＝＝＝＝班到模組
end
