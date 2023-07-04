FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    first_name {"苗字"}
    last_name {"名前"}
    first_name_kana {"カタカナ"}
    last_name_kana {"カタカナ"}
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
    email {Faker::Internet.free_email}
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end

