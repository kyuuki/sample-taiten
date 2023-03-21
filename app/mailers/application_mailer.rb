class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@#{Rails.configuration.setting[:domain]}"
  layout "mailer"
end
