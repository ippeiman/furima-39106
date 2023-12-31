class PostageForm
  include ActiveModel::Model
  
  attr_accessor :user_id, :item_id, :post_code, :shipping_area_id, :city, :house_number, :building_name, :phone_number, :token


  with_options presence: true do
    
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipping_area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    
    validates :token
  end

  def save
    postage = Postage.create(user_id: user_id, item_id: item_id)
    
    Payment.create(postage_id: postage.id, post_code: post_code, shipping_area_id: shipping_area_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)
  end
end