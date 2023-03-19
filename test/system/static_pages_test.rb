require "application_system_test_case"

class StaticPagesTest < ApplicationSystemTestCase
  test "visiting root" do
    visit root_url

    assert_selector "h1", text: "ルートページ"
  end
end
