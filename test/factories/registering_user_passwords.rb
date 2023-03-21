FactoryBot.define do
  factory :registering_user_password do
    registering_user { nil }
    password_digest { "MyString" }
  end
end
