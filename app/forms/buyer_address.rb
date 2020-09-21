class BuyerAddress
  
   include ActiveModel::Model
   attr_accessor :postal_code, :prefectures_id, :city, :address, :phone_number, :building_name,:token,:user_id,:item_id
  #  attr_accessorでitem_id/user_idの定義が必要になります
  # モデルとコントローラーにカード情報の記述しない
  with_options presence: true do
    validates :postal_code, format: {with:/\A\d{3}[-]\d{4}\z/,message:"Postal code Input correctly"}
    validates :prefectures_id, numericality: { other_then: 0, message:"Prefecture Select"}
    validates :city
    validates :address
    validates :phone_number, length: {maximum: 11 },format: {with:/\A\d{10,11}\z/,message:"Phone number can't be blank."}
    validates :token
  end

  def save
    buyer = Buyer.create(user_id:user_id,item_id:item_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, city: city, address: address, phone_number:phone_number, building_name:building_name,buyer_id:buyer.id)
  end
 end