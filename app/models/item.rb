class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :item_purchases
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :item_burden
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :shipping_day
  has_one_attached :image


  validates :name, :explanation, :category, :item_status, :item_burden, :delivery_area, :shipping_day, presence: true
  validates :selling_price, presence: true, format: { with: /\A[0-9]+\z/}, length: { in: 300..9999999}
  validates :image, presence: true

  validates :category_id, :item_status_id, :item_burden_id, :delivery_area_id, :shipping_day_id, numericality: { other_than: 1 }

end
