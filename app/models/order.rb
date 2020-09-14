class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :delivery_address
  has_one_attached :image
end
