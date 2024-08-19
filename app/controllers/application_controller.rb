class ApplicationController < ActionController::Base
  # https://qiita.com/you8/items/a98596547c12d844c53d
  helper_method :logged_in?, :current_user

  #
  # ログイン機能
  #
  # - TODO: 別ファイルにわける
  # - メソッド名は Devise を参考に
  #
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session[:user_id] = nil
  end

  def logged_in?
    # !!
    !!session[:user_id]
  end

  def current_user
    return nil if session[:user_id].nil?

    # ||=
    @current_user ||= User.find_by(id: session[:user_id])

    @current_user
  end

  #
  # フィルター用ユーザー認証メソッド
  #
  def authenticate_user!
    if not logged_in?
      flash[:alert] = t("session.please_login")
      redirect_to log_in_url
    end
  end
end
