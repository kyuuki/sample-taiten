#
# プロフィール編集
#
# - 認証用のお試しページ
#
class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
  end

  def update
  end
end
