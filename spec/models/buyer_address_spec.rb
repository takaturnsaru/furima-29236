require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  before do
    @buyer = FactoryBot.build(:buyer_address)
  end
  describe "購入機能" do
    it "全ての値が正しく入力されていれば登購入できる" do
      expect(@buyer).to be_valid
    end
    it "postal_code存在されていれば購入できる" do
      @buyer.postal_code = "430-0029"
      expect(@buyer).to be_valid 
    end
    it "prefectures_idが存在すれば購入できる" do
      @buyer.prefectures_id = 2
      expect(@buyer).to be_valid
    end
    it "cityが存在すれば購入できる" do
      @buyer.city = "上越市"
      expect(@buyer).to be_valid
    end
    it "addressが存在すればと購入できる" do
      @buyer.address = "海老ヶ瀬29-9"
      expect(@buyer).to be_valid
    end
    it "phone_numberが存在すれば購入できる" do
      @buyer.phone_number = "09098765432"
      expect(@buyer).to be_valid
    end
    it "tokenが存在すれば購入できる" do
      @buyer.token = "oijaihia;hgriahg;ih"
      expect(@buyer).to be_valid
    end
  end

  describe "購入できないとき" do
    it "postal_codeが空の時購入できない" do
      @buyer.postal_code = nil
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Postal code Postal code Input correctly")
    end
    it "postal_codeにはハイフンがないと購入できない" do
      @buyer.postal_code = "0000000"
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Postal code Postal code Input correctly")
    end
    it "prefecturesが空だと購入できない" do
      @buyer.prefectures_id = ""
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Prefectures can't be blank")
    end
    it "cityが空だと購入できない" do
      @buyer.city = ""
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("City can't be blank")
    end
    it "addressが空だと購入できない" do
      @buyer.address = ""
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Address can't be blank")
    end
    it "phone_numberが空だと購入できない" do
      @buyer.phone_number = ""
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Phone number can't be blank")
    end
    it "phone_numberは11桁以内でないと購入できない" do
      @buyer.phone_number = "090123456789" 
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
    it "tokenが空だと購入できない" do
      @buyer.token = ""
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Token can't be blank")
    end
  end   
end
