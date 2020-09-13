require 'rails_helper'

RSpec.describe Item, type: :model do
  before do 
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("/files/test.jpeg")
  end

  describe "出品登録" do
    context "登録がうまくいく時" do
      it "image,name,explanation,category,status,shippin_fee,shipping_area,day_until_shipping,priceが存在すれば登録できる" do
         expect(@item).to be_valid
      end
      it "imageが存在すれば登録できる" do
        @item.image = fixture_file_upload("/files/test.jpeg")
        expect(@item).to be_valid
      end
      it "nameが存在すれば登録できる" do
        @item.name = "服"
        expect(@item).to be_valid
      end
      it "explanationが存在すれば登録できる" do
        @item.explanation = "新品未使用"
        expect(@item).to be_valid
      end
      it "categoryが存在すれば登録できる" do
        @item.category = 2
        expect(@item).to be_valid
      end
      it "statusが存在すれば登録できる" do
        @item.status = 2
        expect(@item).to be_valid
      end
      it "shippig_feeが存在すれば登録できる" do
        @item.shipping_fee = 2
        expect(@item).to be_valid
      end
      it "shipping_areaが存在すれば登録できる" do
        @item.shipping_area = 2
        expect(@item).to be_valid
      end
      it "day_until_shippingが存在すれば登録できる" do
        @item.day_until_shipping = 2
        expect(@item).to be_valid
      end
      it "priceが存在すれば登録できる" do
        @item.price = 10000
        expect(@item).to be_valid
      end
    end

    context "登録がうまくいかないとき" do
      it "imageが存在しないとき" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "explanationが空だと登録できない" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "categoryが選択されていないと登録できない" do
        @item.category = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Ctegory Select")
      end
      it "statusが選択されていないと登録できない" do
        @item.status = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Status Select")
      end
      it "shipping_feeが選択されていないと登録できない" do
        @item.shipping_fee = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee Shipping fee Select")
      end
      it "shipping_areaが選択されていないと登録できない" do
        @item.shipping_area = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area Shipping area Select")
      end
      it "day_until_shippingが選択されていないと登録できない" do
        @item.day_until_shipping = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Day until shipping Day until shipping Select")
      end
      it "priceが空だと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Price Out of setting range")
      end
    end
  end
end