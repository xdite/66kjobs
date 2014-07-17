class SubscriptionMailer < ActionMailer::Base
  default from: "\"66Kjobs\" #{Setting.email_sender}"

  def confirm_email(subscription)
    @subscription = subscription

    mail(:to => @subscription.email, :subject => "[66Kjobs] 感謝您對訂閱本站電子報有興趣，請確認 Email 地址。")
  end
end
