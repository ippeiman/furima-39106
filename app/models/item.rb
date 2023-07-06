class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

belongs_to :user
has_one :order_information

belongs_to :category
belongs_to :shipping_area
belongs_to :condition
belongs_to :shipping_cost
belongs_to :delivary_day

has_one_attached :image

with_options presence: true do
  validates :user_id
  validates :image
  validates :name
  validates :description
  validates :category_id
  validates :condition_id
  validates :shipping_cost_id
  validates :shipping_area_id
  validates :delivary_day_id
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
 end

with_options numericality: { other_than: 0 } do
  validates :category_id
  validates :shipping_area_id
  validates :condition_id
  validates :shipping_cost_id
  validates :delivary_day_id
 end
end
