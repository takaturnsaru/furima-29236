class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :price,numericality:{only_integer:true,greater_than:300,less_than:9999999,message: "Price Out of setting range"}
  with_options presence: true do
    validates :image
    validates :name, length: {maximum:40}
    validates :explanation, length: {maximum:1000}
    validates :category, numericality: { other_than: 0, message: "Ctegory Select" }
    validates :status,numericality: { other_than: 0, message: "Status Select" }
    validates :shipping_fee,numericality: { other_than: 0, message: "Shipping fee Select" }
    validates :shipping_area,numericality: { other_than: 0, message: "Shipping area Select" }
    validates :day_until_shipping,numericality: { other_than: 0, message: "Day until shipping Select" }
  end
    

  
end
