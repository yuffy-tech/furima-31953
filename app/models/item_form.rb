class ItemForm
    include ActiveModel::Model
    attr_accessor :token, :user_id, :item_id, :postal_code, :start_area_id, :municipality, :address, :building_name, :phone_number, :management

    with_options presence: true do

    validates :token
    validates :price

    validates :user_id
    validates :item_id
    validates :postal_code , format: { with: /\A[0-9]{3}[-][0-9]{4}\z/ }
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid."}
    end

    #ジャンルの選択が「--」の時は保存できないようにする
    with_options numericality:{ other_than: 1 } do
    validates :start_area_id
    end

  def save
      # 各テーブルにデータを保存する処理を書く
     management =Management.create(user_id: user_id, item_id: item_id)
     ShippingAddress.create(postal_code: postal_code, start_area_id: start_area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, management_id: management.id)
  end
end