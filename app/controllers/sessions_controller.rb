#
# セッション (ログイン) コントローラー
#
class SessionsController < ApplicationController
  def new
    @form = LogInForm.new
  end

  def create
    @form = LogInForm.new(log_in_form_params)

    if not @form.valid?
      render :new
      return
    end

    #user = User.find_by(email: form.email)
    #user_password_authentication = UserPasswordAuthentication.find_by(user: user)
    user_password_authentication = UserPasswordAuthentication.joins(:user)
                                     .find_by(users: { email: @form.email })

    if user_password_authentication.nil? || (not user_password_authentication.authenticate(@form.password))
      # ログインエラー
      flash.now[:alert] = t("session.login_error")
      render :new
      return
    end

    log_in(user_password_authentication.user)

    # TODO: 現在表示しているページを保持するしくみ
    redirect_to root_path, notice: t("session.login_complete")
  end

  def delete
    log_out

    # TODO: 現在表示しているページを保持するしくみ
    redirect_to root_path, notice: t("session.logout_complete")
  end

  private
    def log_in_form_params
      params.require(:log_in_form).permit(:email, :password)
    end
end
