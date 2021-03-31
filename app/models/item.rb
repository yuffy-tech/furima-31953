class Item < ApplicationRecord
    has_one :management
    belongs_to :user
    has_one_attached :image
end
