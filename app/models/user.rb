class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "is invalid. Input full-width characters.", allow_blank: true }
    validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "is invalid. Input full-width characters.", allow_blank: true }
    validates :first_name_reading, format: {with: /\A[ァ-ヶ一-]+\z/, message: "is invalid. Input full-width katakana characters.", allow_blank: true }
    validates :last_name_reading, format: {with: /\A[ァ-ヶ一-]+\z/, message: "is invalid. Input full-width katakana characters.", allow_blank: true}
    validates :birth_date
  end
end
