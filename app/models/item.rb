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


  validates :name, :explanation, presence: true
  validates :selling_price, presence: true, numericality: { greater_than_or_equal_to:300 ,less_than_or_equal_to:9999999 , message: "範囲外です" }
  validates :selling_price, numericality: { with: /\A[0-9]+\z/ , message: "は半角数字で入力してください" }
  validates :image, presence: { message: "を選択してください"}

  validates :category_id, :item_status_id, :item_burden_id, :delivery_area_id, :shipping_day_id, numericality: { other_than: 1, message: "を選択してください"}
end
