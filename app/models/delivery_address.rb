class DeliveryAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :order
  belongs_to_active_hash :delivery_area

  with_options presence: true do
    validates :post_number
    validates :municipality
    validates :address
    validates :phone_number
    validates :delivery_area_id, numericality: { other_than: 1, message: "を選択してください"}
  end
end
