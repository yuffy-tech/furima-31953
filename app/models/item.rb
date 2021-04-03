class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions

    belongs_to :category_id
    belongs_to :delivery_burden_id
    belongs_to :delyvery_day_id
    belongs_to :start_area_id
    belongs_to :status_id

  #空の投稿を保存できないようにする
  validates :title, :text, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 } 
  validates :delivery_burden_id, numericality: { other_than: 1 } 
  validates :delyvery_dayid, numericality: { other_than: 1 } 
  validates :start_area_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 

    has_one :management
    belongs_to :user
    has_one_attached :image
end
