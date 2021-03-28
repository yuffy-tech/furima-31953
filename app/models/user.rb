class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana,format:{with: /\A[ァ-ヶー－]+\z/}
  validates :last_name_kana,format:{with: /\A[ァ-ヶー－]+\z/}
  validates :birth_date, presence: true
end