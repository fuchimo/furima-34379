class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :last_name
    validates :first_name_reading
    validates :last_name_reading
    validates :birth_date
  end

  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'is invalid. Input full-width characters.', allow_blank: true } do
    validates :first_name
    validates :last_name
  end

  with_options format: { with: /\A[ァ-ヶ一-]+\z/, message: 'is invalid. Input full-width katakana characters.',
                         allow_blank: true } do
    validates :first_name_reading
    validates :last_name_reading
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid.', allow_blank: true }
end
