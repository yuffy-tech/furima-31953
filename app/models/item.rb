class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions

    belongs_to :category
    belongs_to :delivery_burden
    belongs_to :delivery_day
    belongs_to :start_area
    belongs_to :status

  #空の投稿を保存できないようにする
  validates :name, :image, :text, :category_id, :status_id, :delivery_burden_id, :start_area_id, :delivery_day_id, :price, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 } 
  validates :delivery_burden_id, numericality: { other_than: 1 } 
  validates :delivery_day_id, numericality: { other_than: 1 } 
  validates :start_area_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 

    has_one :management
    belongs_to :user
    has_one_attached :image
end
