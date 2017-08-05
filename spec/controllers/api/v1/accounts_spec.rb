require 'rails_helper'

RSpec.describe Api::V1::AccountsController, type: :controller do
  describe "POST 'create'" do
    subject { post :create, params: param_attributes, format: :json }

    let(:param_attributes) do
      {
        name: name
      }
    end
    let(:name) { "le-name" }

    context 'when params is correct' do
      it 'creates a new Account' do
        expect { subject }.to change(Account, :count).by(1)
      end

      it 'return status code equal 200' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
