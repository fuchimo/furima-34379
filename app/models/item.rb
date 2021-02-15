class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :sendingDay

  with_options presence: true do
    validates :item_name
    validates :item_explain
    validates :item_price
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :prefecture_id
    validates :sending_day_id
    validates :user
    validates :image
  end

  with_options numericality: { only_integer: true } do
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :prefecture_id
    validates :sending_day_id
  end

  validates :item_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than: 10000000}
  validates :item_price, format: { with: /\A[0-9]+\z/, message: 'is invalid.', allow_blank: true }

end
