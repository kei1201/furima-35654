FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            { 'test' }
    last_name             { 'test' }
    kana_frist            { 'test' }
    kana_last             { 'test' }
    birthday              { '2020-01-01' }
  end
end