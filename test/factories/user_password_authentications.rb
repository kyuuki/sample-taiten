FactoryBot.define do
  factory :user_password_authentication do
    user { nil }
    password_digest { "MyString" }
  end
end
