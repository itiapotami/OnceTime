FactoryBot.define do
  factory :owner do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             {"佐藤"}
    first_name            {"太郎"}
    last_kana             {"サトウ"}
    first_kana            {"タロウ"}
    phone_number         {"09088015851"}
  end
end
