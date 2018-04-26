class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # 正規表現
  KANA_REGEXP = /\A([ァ-ン]|ー)+\z/
  POSTAL_TELL_REGEXP = /\A[0-9¥-]+\z/

  #Validation設定
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_kana, presence: true
  validates :first_kana, format: { with: KANA_REGEXP, message: "カタカナのみが使用できます" }, if: "first_kana.present?"
  validates :last_kana, presence: true
  validates :last_kana, format: { with: KANA_REGEXP, message: "カタカナのみが使用できます" }, if: "last_kana.present?"
  validates :postal_code, presence: true
  validates :postal_code, format: { with: POSTAL_TELL_REGEXP, message: "数字とハイフンのみが使用できます" }, length: { minimum: 8 },if:"postal_code.present?"
  validates :address, presence: true
  validates :tell, presence: true
  validates :tell, format: { with: POSTAL_TELL_REGEXP,message: "数字とハイフンのみが使用できます" }, length: { minimum: 11 },if:"tell.present?"

  has_many :sub_addresses
  has_many :order_histories

  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      all
    end
  end

end
