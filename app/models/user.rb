class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
          with_options presence: true do
  validates :first_name
  validates :email
  validates :last_name
  validates :birth_date
  validates :nickname
          end
  validates :password, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/}
  validates :first_name, format:{with: /\A[ぁ-んァ-ン一-龥]/}
  validates :last_name, format:{with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name_kana,format:{with: /\A[ァ-ヶー－]+\z/}
  validates :last_name_kana,format:{with: /\A[ァ-ヶー－]+\z/}
end