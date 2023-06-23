class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :order_informations

  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :birth_date, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A.+@.+..+\z/, message: 'は有効でありません。' }
  validates :password, length: { minimum: 6 }
  validates :password, format: { with: /\A(?=.?[a-z])(?=.?\d)[a-z\d]+\z/i, message: 'は英字と数字の両方を含めて設定してください。' }
  validates :password_confirmation, presence: true, on: :create
end
