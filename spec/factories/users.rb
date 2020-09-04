FactoryBot.define do
  factory :user do
    nickname                { Faker::Name.name }
    email                   { Faker::Internet.free_email }
    password                { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation   { password }
    kanji_family_name       { Faker::Name.last_name }
    kanji_first_name        { Faker::Name.first_name }
    kana_family_name        { 'カタカナ' }
    kana_first_name         { 'カタカナ' }
    birthday                { Faker::Date.birthday }
  end
end
