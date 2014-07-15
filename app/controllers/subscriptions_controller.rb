class SubscriptionsController < ApplicationController

  def new
    @subscription = EmailSubscription.new
  end

  def create
    @subscription = EmailSubscription.new(subscription_params)

    if @subscription.save
      redirect_to new_subscription_path , :notice => "感謝您對 66K 職缺有興趣，我們會寄送一封郵件給您確認 Email 位址。"
    else
      render :new
    end
   # if @subscription.register
   #   redirect_to :back , :notice => "訂閱成功"
   # else
   #   flash[:danger] = "訂閱失敗"
   #   render :new
   # end
  end


  private

  def subscription_params
    params.require(:email_subscription).permit(:email,:name)
  end

end
