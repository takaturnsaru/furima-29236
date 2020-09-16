class UserBuyer
  
  indlude ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :city, :address, :phone_number, :building_name

  with_options presence: true do
    validates :postal_code, format: {with:/\A[0-9]{3}-[0-9]{4}\z/,message:"Postal code Input correctly"}
    validates :prefectures_id, numericality: { other_then: 0, message:"Prefecture Select"}
    validates :city,{message:"City can't be blank"}
    validates :address,{message:"Address can't be blank"}
    validates :phone_number, format: {with:/\A\d{10,11}\z/、message:"Phone number can't be blank."}
  end

  def save
    Address.creat(postal_code: postal_code, prefectures_id: prefectures_id, city: city, address: address, phone_number:phone_number, building_name:building_name,buyer_id:buyer.id)
  end
end