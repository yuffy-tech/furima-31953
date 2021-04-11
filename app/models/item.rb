class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions

    belongs_to :category
    belongs_to :delivery_burden
    belongs_to :delivery_day
    belongs_to :start_area
    belongs_to :status

  #空の投稿を保存できないようにする
  validates :name, :image, :text, :category_id, :status_id, :delivery_burden_id, :start_area_id, :delivery_day_id, :price, presence: true
  
  #価格の範囲が、¥300~¥9,999,999の間であること,販売価格は半角数字のみ保存可能であること
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
 
  #販売価格は半角数字のみ保存可能であること
  validates :price, format:{with: /\A[0-9]+\z/}


  #ジャンルの選択が「--」の時は保存できないようにする
   with_options numericality:{ other_than: 1 } do
    validates :category_id
    validates :delivery_burden_id
    validates :delivery_day_id
    validates :start_area_id
    validates :status_id
   end

    has_one :management
    belongs_to :user
    has_one_attached :image
end