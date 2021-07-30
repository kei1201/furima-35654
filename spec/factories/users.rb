FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {'123456a'}
    password_confirmation {'123456a'}
    last_name             {'山田'}
    first_name            {'太朗'}
    kana_first            {'ヤマダ'}
    kana_last             {'タロウ'}
    birthday              {Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today)}
  end
end