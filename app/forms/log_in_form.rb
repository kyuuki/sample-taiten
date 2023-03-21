# https://tech.mof-mof.co.jp/blog/rails-form-object/
class LogInForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  # https://qiita.com/alpaca_taichou/items/bebace92f06af3f32898
  # attribute は 5.2 から
  attribute :email, :string
  attribute :password, :string
  # attr_accessor :email, :password (5.2 より前)

  # TODO: Value Object 的な物もので共通化
  validates :email,
    presence: true,
    length: { in: 3..254 }
  validates :password,
    presence: true,
    length: { in: 6..255 }
end
