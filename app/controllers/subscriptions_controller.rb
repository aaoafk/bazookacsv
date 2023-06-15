class SubscriptionsController < ApplicationController

  def create
    @subscription = Subscription.new(subscription_params)

    respond_to do |format|
      if @subscription.save
        format.html do
          render partial: "subscriptions/success", layout: "subscription"
        end
        # format.turbo_stream { turbo_stream.replace "subscription-frame", "subscription_success" }
      else
        format.html do
          render partial: "subscriptions/error", locals: { subscription: @subscription }, layout: "subscription"
        end
        # format.turbo_stream { turbo_stream.replace "subscription-frame", "subscription_success" }
      end
    end
  end

  private

  def subscription_params
    params.permit(:email)
  end
end
