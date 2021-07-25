class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :email, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]{6,}+\z/
  validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX}
  validates :last_name, :first_name, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }
  validates :kana_last, :kana_first, presence: true, format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/ }
  validates :birthday, presence: true
end