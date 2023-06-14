require 'rails_helper'

RSpec.describe SubscriptionsController, type: :controller do
  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) { { subscription: { email: 'test@example.com' } } }

      it 'creates a new subscription' do
        expect {
          post :create, params: valid_params, format: :turbo_stream
        }.to change(Subscription, :count).by(1)
      end

      it 'renders a success toast' do
        post :create, params: valid_params, format: :turbo_stream
        expect(response.body).to include('Success')
        expect(response.body).to include('You have successfully subscribed!')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { subscription: { email: '' } } }

      it 'does not create a new subscription' do
        expect {
          post :create, params: invalid_params, format: :turbo_stream
        }.to_not change(Subscription, :count)
      end

      it 'renders an error toast' do
        post :create, params: invalid_params, format: :turbo_stream
        expect(response.body).to include('Error')
        expect(response.body).to include('There was an error with your subscription.')
      end
    end
  end
end
