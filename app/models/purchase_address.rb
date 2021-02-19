class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_number, :phone_number, :purchase_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code
    validates :city
    validates :house_number
    validates :phone_number
    validates :token
  end

  validates :prefecture_id, numericality: { only_integer: true, message: 'is Unselected' }
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid', allow_blank: true }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid', allow_blank: true }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_number: building_number, phone_number: phone_number, purchase_id: purchase.id )
  end
end