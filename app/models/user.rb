class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "名前は全角で入力して下さい"}
    validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "苗字は全角で入力して下さい"}
    validates :first_name_reading, format: {with: /\A[ァ-ヶ一-]+\z/, message: "名前のフリガナは全角カナで入力して下さい"}
    validates :last_name_reading, format: {with: /\A[ァ-ヶ一-]+\z/, message: "苗字のフリガナは全角カナで入力して下さい"}
    validates :birth_date
  end
end
