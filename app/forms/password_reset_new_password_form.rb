# https://tech.mof-mof.co.jp/blog/rails-form-object/
class PasswordResetNewPasswordForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :token, :string
  attribute :password, :string

  # TODO: Value Object 的な物もので共通化
  validates :token,
    presence: true
  validates :password,
    presence: true,
    length: { in: 6..255 }
end
