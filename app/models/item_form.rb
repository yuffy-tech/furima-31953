class ItemForm
    include ActiveModel::Model
    attr_accessor :user, :item, :postal_code, :start_area_id, :municipality, :address, :building_name, :phone_number, :management

#名前が空だと保存できない
  with_options presence: true do
    validates :first_name
    validates :email
    validates :last_name
    validates :birth_date
    validates :nickname
  end
# パスワードがキチンと書けないとだめ
  validates :password, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/}
#  お金が空ではだめ
  validates :price, presence: true

  with_options format:{with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
   validates :first_name
   validates :last_name
  end
  
  with_options format:{with: /\A[ァ-ヶー－]+\z/} do
   validates :first_name_kana
   validates :last_name_kana
  end

  # 住所モデルのバリデーション
  validates :postal_code, format: {with: /\A[0-9]+\z/, message: "is invalid. Please input half-width characters."}
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
      # 各テーブルにデータを保存する処理を書く
     item =Management.create(user: user, item: item)
     Shipping_address.create(postal_code: postal_code, start_area_id: start_area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, management: management)
  end
end