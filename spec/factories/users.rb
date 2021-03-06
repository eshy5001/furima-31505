FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password( min_length: 4) }
    password_confirmation { password }
    last_name             { person.last.kanji }
    first_name            { person.first.kanji }
    last_name_kana        { person.last.katakana }
    first_name_kana       { person.first.katakana }
    birth_date            { Faker::Date.birthday( min_age: 0, max_age: 200 ) }
  end
end
