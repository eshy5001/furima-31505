FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example.com'}
    password              {'000000'}
    password_confirmation {password}
    last_name             {"太朗"}
    first_name            {"山田"}
    last_name_kana        {"タロウ"}
    first_name_kana       {"ヤマダ"}
    birth_date            {'1930-01-01'}
  end
end