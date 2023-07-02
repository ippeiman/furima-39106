class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        
  #has_many :items
  #has_many :order_informations

validates :nickname, presence: true
validates :first_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "can only contain letters" }
validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "can only contain letters" }
validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "can only contain katakana" }
validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "can only contain katakana" }
validates :birth_date, presence: true


end
