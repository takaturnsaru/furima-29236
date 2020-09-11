class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :items
         with_options presence: true do
           validates :nickname
           validates :email,uniqueness:true, format: {with:/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
           validates :password, confirmation: true, format: {with:/\A(?=\d{0,99}+[a-z])(?=[a-z]{0,99}+\d)[a-z\d]+\z/i}, length: { minimum:6 } 
           validates :password_confirmation
           validates :family_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
           validates :first_name, format: {with: /\A[ぁ-んァ-ンー-龥]/, message: "is invalid. Input full-width characters."}
           validates :family_name_reading, format: {with:/\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
           validates :first_name_reading, format: {with:/\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
           validates :birthday
         end

end
