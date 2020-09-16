class OrderAddress

  include ActiveModel::Model
  attr_accessor :post_number, :delivery_area_id, :municipality, :address, :building, :phone_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :post_number, format: { with: /\A\d{3}[-]\d{4}\z/ , message: "を正しく入力してください"}
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d[0-9]{,11}\z/ , message: "を正しく入力してください"}
    validates :token
  end
  validates :delivery_area_id, numericality: { other_than: 1, message: "を選択してください"}

  def save
    DeliveryAddress.create(post_number: post_number, delivery_area_id: delivery_area_id, municipality: municipality, address: address, building: building, phone_number: phone_number)
  end
end
