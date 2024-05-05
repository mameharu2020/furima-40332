class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :addresses, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "should be 10 or 11 digits without hyphens" }
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture: prefecture, city: city, addresses: addresses, building: building, order_id: order.id)
  end
  
end