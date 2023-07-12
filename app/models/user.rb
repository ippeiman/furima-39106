class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  # has_many :order_informations

  validates :nickname, presence: true
  validates :first_name, presence: true,
                         format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: 'can only contain letters' }
  validates :last_name, presence: true,
                        format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: 'can only contain letters' }
  validates :first_name_kana, presence: true,
                              format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'can only contain katakana' }
  validates :last_name_kana, presence: true,
                             format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'can only contain katakana' }
  validates :birth_date, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end
