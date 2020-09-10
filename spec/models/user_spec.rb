require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "会員情報入力" do
    it "ニックネームが必須であること" do
      @user.nickname = ""
      @user.valid?
      binding.pry
    end
    it "メールアドレスが必須であること" do
    end
    it "メールアドレスが一意性であること" do
    end
    it "メールアドレスは＠が含む必要があること" do
    end
    it "パスワードが必須であること" do
    end
    it "パスワードが６文字以上であること" do
    end
    it "パスワード半角英数混合であること" do
    end
    it "パスワードは確認ようを含めて2回入力すること" do
    end
    it "新規登録・ログイン共にエラーハンドリングができていること" do
    end
    it "ユーザー本名が、名字と名前がそれぞれ必須であること"
    end
    it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること" do
    end
    it "ユーザー本名のフリガナが、名字と名前がそれぞれ必須であること" do
    end
    it "ユーザー本名のフリガナは全角（カタカナ）で入力させること" do
    end
    it "生年月日が必須であること" do
    end
  end

