class SubscriptionsController < ApplicationController

  def create
    @subscription = Subscription.new(subscription_params)

    # respond_to do |format|
    if @subscription.save
      # format.html { turbo_stream.replace("subscription-frame", partial: "subscriptions/success") }
      # format.turbo_stream { turbo_stream.replace "subscription-frame", "subscription_success" }
      render turbo_stream: turbo_stream.replace("subscription-frame", partial: "subscriptions/success")
    else

      render turbo_stream: turbo_stream.replace("subscription-frame", partial: "subscriptions/error")
      # format.html { turbo_stream.replace("subscription-frame", partial: "subscriptions/error") }
      # format.turbo_stream { turbo_stream.replace "subscription-frame", "subscription_success" }
    end
    # end
  end

  private

  def subscription_params
    params.permit(:email)
  end
end
