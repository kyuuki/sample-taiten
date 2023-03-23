FactoryBot.define do
  factory :password_reset do
    user { nil }
    token { "MyString" }
    sent_at { "2023-03-21 15:16:48" }
  end
end
