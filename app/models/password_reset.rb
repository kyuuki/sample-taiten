class PasswordReset < ApplicationRecord
  belongs_to :user

  # TODO: 文字数がわかれば、データベースの文字列の長さを制限した方がよい
  def self.new_token
    SecureRandom.urlsafe_base64
  end
end
