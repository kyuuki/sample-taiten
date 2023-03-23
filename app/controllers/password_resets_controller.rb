#
# パスワードリセットコントローラー
#
class PasswordResetsController < ApplicationController
  #
  # パスワードリセット開始画面
  #
  def new
    @form = PasswordResetForm.new
  end

  #
  # パスワードリセット開始
  #
  def create
    # TODO: 共通化
    now = Time.zone.now

    @form = PasswordResetForm.new(password_reset_form_params)

    if not @form.valid?
      render :new
      return
    end

    # メールアドレスが存在していればトークン発行
    # TODO: 連続して行われる対策を (メール全体に対してもいえること)
    user = User.find_by(email: @form.email)
    if user.nil?
      # メールアドレスが登録されているかがわからないように成功したときと同様にふるまう
      logger.info("Input unknown email (#{@form.email})")
      redirect_to password_reset_url, notice: "登録されているメールアドレス宛にメールを送信しました。"
      return
    end

    # TODO: 同時実行考える
    # パスワードリセット中のチェック
    password_reset = PasswordReset.find_by(user: user)

    ActiveRecord::Base.transaction do
      # パスワードリセット中ならデータ削除
      unless password_reset.nil?
        password_reset.destroy!
      end

      # トークン生成
      password_reset = PasswordReset.create!(user: user, token: PasswordReset.new_token, sent_at: now)

      # メール送信
      UserMailer.password_reset(user, password_reset.token).deliver_now
    end

    # TODO: 現在表示しているページを保持するしくみ
    redirect_to password_reset_url, notice: "登録されているメールアドレス宛にメールを送信しました。"
  end

  #
  # 新しいパスワード入力画面
  #
  def new_password
    # TODO: トークンの有効期限のしくみ
    token = params[:token]

    password_reset = PasswordReset.find_by(token: token)
    if password_reset.nil?
      logger.info("Unknown token (#{token})")
      redirect_to root_path, alert: "URL をもう一度確認してください。"  # TODO: メッセージ一元化
      return
    end

    @form = PasswordResetNewPasswordForm.new
    @form.token = token
  end

  #
  # 新しいパスワードに更新
  #
  def new_password_update
    # TODO: トークンの有効期限のしくみ
    @form = PasswordResetNewPasswordForm.new(password_reset_new_password_form_params)

    # TODO: URL 違うから再読込とかおかしいことになりそう (GET と POST で URL を揃えておくのがかっこよさそう)
    if not @form.valid?
      render :new_password
      return
    end

    password_reset = PasswordReset.find_by(token: @form.token)
    if password_reset.nil?
      # TODO: タイムアウトで無効になっているか。他の画面で更新済み。など
      redirect_to root_path, alert: "最初から実行してください。"
      return
    end

    user_password_authentication = UserPasswordAuthentication.find_by(user: password_reset.user)
    if user_password_authentication.nil?
      # TODO: 現状、ない場合はないはずなので、詳細にログを出力しておくこと
      redirect_to root_path, alert: "最初から実行してください。"
      return
    end

    # TODO: エラー処理
    ActiveRecord::Base.transaction do
      user_password_authentication.update!(password: @form.password)
      password_reset.destroy!
    end

    redirect_to root_path, alert: "パスワードを変更しました。"
  end

  private
    def password_reset_form_params
      params.require(:password_reset_form).permit(:email)
    end

    def password_reset_new_password_form_params
      params.require(:password_reset_new_password_form).permit(:token, :password)
    end
end
