class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders
  
  with_options presence: true do
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
    validates :nickname
    validates :last_name, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }
    validates :first_name,format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }
    validates :kana_last, format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/ }
    validates :kana_first, format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/ }
    validates :birthday
  end
end
