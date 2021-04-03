class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category_id
    belongs_to :delivery_burden_id
    belongs_to :delyvery_burden_id
    belongs_to :start_area_id
    belongs_to :status_id



    has_one :management
    belongs_to :user
    has_one_attached :image
end
