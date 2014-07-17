class SubscriptionsController < ApplicationController

  def new
    @subscription = EmailSubscription.new
    set_page_title "訂閱工作速遞"
  end

  def create
    @subscription = EmailSubscription.new(subscription_params)

    if @subscription.save
      SubscriptionMailer.confirm_email(@subscription).deliver
      redirect_to new_subscription_path , :notice => "感謝您對 66K 職缺有興趣，我們會寄送一封郵件給您確認 Email 位址。"
    else
      render :new
    end
  end

  def verify
    @subscription = EmailSubscription.find_by_token(params[:id])

    @subscription.subscribe_to!(Setting.newspaper_email)

    redirect_to root_path , :notice => "訂閱電子報成功"
  end


  private

  def subscription_params
    params.require(:email_subscription).permit(:email,:name)
  end

end
