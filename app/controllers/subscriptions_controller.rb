class SubscriptionsController < ApplicationController

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(subscription_params)

    if @subscription.register
      redirect_to :back , :notice => "訂閱成功"
    else
      flash[:error] = "訂閱失敗"
      render :new
    end
  end


  private

  def subscription_params
    params[:subscription].permit(:email,:name)
  end

end
