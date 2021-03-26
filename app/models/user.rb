class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :encrypted_password,:password_confirmation,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/}
  validates :name,presence: true
  validates :name_kana,format:{with: /\A[ｧ-ﾝﾞﾟ]+\z/}
  validates :name_kana- presence: true
  validates :name_kana,format: { with: /\A[A-Za-z]\w*\z/ }
  validates :birthday , presence: true
end