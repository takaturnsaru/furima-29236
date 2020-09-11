require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "新規登録" do
    context "登録がうまくいくとき" do
      it "nicknamaとemail,password,password_confirmation,family_name,first_name,family_name_reading,first_name_reading,birthdayが存在すれば登録できる"do
        expect(@user).to be_valid
      end
      it "emailが＠を含んでいれば登録できる" do
        @user.email = "tifleih@gmail.com"
        expect(@user).to be_valid
      end
      it "passwordが６文字以上,半角英数混合であること、確認用で2回入力すること" do
        @user.password = "o123456"
        @user.password_confirmation = "o123456"
        expect(@user).to be_valid
      end
      it "family_nameが全角（漢字・ひらがな・カタカナ）であること" do
        @user.family_name  = "田中"
        expect(@user).to be_valid
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）であること" do
        @user.first_name = "健太郎"
        expect(@user).to be_valid
      end
      it "family_name_readingが全角（カタカナ）であること" do
        @user.family_name_reading = "タナカ"
        expect(@user).to be_valid
      end
      it "first_name_readingが全角（カタカナ）であること" do
        @user.first_name_reading = "アヤカ"
        expect(@user).to be_valid
      end
    end

    context "新規登録がうまくいかないとき" do
      it "nicknameが空だと登録できない" do
        @user.nickname =""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したenailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")      end
      it "emailに＠が含まないと登録できない"do
        @user.email = "egsghehethh.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが５文字以下だと登録できない" do
        @user.password = "oooo"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが半角英数混合でないと登録できない" do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordは確認用含めて2回入力しないと登録できない" do
        @user.password_confirmation =""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end
      it "family_nameが空だと登録できない" do
        @user.family_name =""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "family_nameが全角（漢字・ひらがな・カタカナ）以外だと登録できない" do
        @user.family_name ="eeeeee"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name =""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）以外だと登録できない" do
        @user.first_name ="oooooo"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it "family_name_readingが空だと登録できない"do
        @user.family_name_reading =""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading can't be blank")
      end
      it "family_name_readingが全角（カタカナ）でないと登録できない" do
        @user.family_name_reading ="ﾀﾅｶ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading is invalid. Input full-width katakana characters.")
      end
      it "first_name_readingが空だと登録できない" do
        @user.first_name_reading =""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end
      it "first_name_readingが全角（カタカナ）でないと登録でいきない" do
        @user.first_name_reading ="ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invalid. Input full-width katakana characters.")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday =""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end

  describe "ログイン" do
    context "ログインがうまくいくとき"
      it "emailとpasswordが登録情報と一致すればログインできる"
  
end


