class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, shortcuts: [:name]
  belongs_to_active_hash :status, shortcuts: [:name]
  belongs_to_active_hash :shipping_fee, shortcuts: [:name]
  belongs_to_active_hash :shipping_area, shortcuts: [:name]
  belongs_to_active_hash :day_until_shipping, shortcuts: [:name]

  validates :price,numericality:{only_integer:true,greater_than:300,less_than:9999999,message: "Price Out of setting range"}
  with_options presence: true do
    validates :image
    validates :name, length: {maximum:40}
    validates :explanation, length: {maximum:1000}
    validates :category_id, numericality: { other_than: 0, message: "Ctegory Select" }
    validates :status_id,numericality: { other_than: 0, message: "Status Select" }
    validates :shipping_fee_id,numericality: { other_than: 0, message: "Shipping fee Select" }
    validates :shipping_area_id,numericality: { other_than: 0, message: "Shipping area Select" }
    validates :day_until_shipping_id,numericality: { other_than: 0, message: "Day until shipping Select" }
  end
    

  
end
