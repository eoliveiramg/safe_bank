require 'rails_helper'

RSpec.describe Api::V1::BalancesController, type: :controller do
  describe 'GET #index' do
    let(:vaults) { create_list(:vault, 10) }

    context 'when receive get without params' do
      before { get :index, format: :json }

      it 'return status code equal 404 and render JSON tha includes error message' do
        expect(response).to have_http_status(:not_found)
        expect(response.message).to eq('Not Found')
      end
    end

    context 'when receive get with params valid' do
      let(:params) do
        {
          account_id: Account.first.id
        }
      end

      before do
        create :account
        get :index, params: params, format: :json
      end

      it 'return status code equal 200 and render JSON' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when receive get with params invalid' do
      let(:params) do
        {
          account_id: 89086666777
        }
      end

      before do
        create :account
        get :index, params: params, format: :json
      end

      it 'return status code equal 404 and render JSON' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
