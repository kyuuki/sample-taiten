class PasswordResetForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :email, :string

  # TODO: Value Object 的な物もので共通化
  validates :email,
    presence: true,
    length: { in: 3..254 }
end
