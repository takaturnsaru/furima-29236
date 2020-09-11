FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number:2)}
    email                 {"amition.cha@gmail.com"}
    password              {Faker::Internet.password(min_length:6)}
    password_confirmation {password}
    family_name           {"田中"}
    first_name            {"太郎"}
    family_name_reading   {"タナカ"}
    first_name_reading    {"タロウ"}
    birthday              {"1933/1/1"}
  end
end
#1933_1_1
#1933-1-1
