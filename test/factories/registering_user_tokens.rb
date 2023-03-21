FactoryBot.define do
  factory :registering_user_token do
    registering_user { nil }
    token { "MyString" }
  end
end
