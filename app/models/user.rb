class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders
  
  with_options presence: true do
    validates :nickname
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]{6,}+\z/
    validates :password, format: { with: VALID_PASSWORD_REGEX}
    validates :last_name, :first_name, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }
    validates :kana_last, :kana_first, format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/ }
    validates :birthday
  end
end
