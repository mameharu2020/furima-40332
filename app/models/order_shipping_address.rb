class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id

    validates :postal_code  , presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
    validates :city         , presence: true
    validates :addresses    , presence: true
    validates :phone_number , presence: true, format: { with: /\A\d{10,11}\z/, message: "should be 10 or 11 digits without hyphens" }
    validates :user_id      , presence: true
    validates :item_id      , presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end