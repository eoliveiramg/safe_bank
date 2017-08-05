require 'rails_helper'

RSpec.describe Api::V1::VaultsController, type: :controller do
  describe "POST 'create'" do
    subject { post :create, params: param_attributes, format: :json }

    let(:param_attributes) do
      {
        value: value,
        type_value: type_value,
        account_id: account.id
      }
    end
    let(:value) { Faker::Number.decimal(6, 2) }
    let(:type_value) { "debit" }
    let(:account) { create :account }

    context 'when params is correct' do
      it 'creates a new Vault' do
        expect { subject }.to change(Vault, :count).by(1)
      end

      it 'return status code equal 200' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
