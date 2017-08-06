require 'rails_helper'

RSpec.describe BalanceFactory do
  describe ".build" do
    subject { described_class.build(value, params) }

    let(:params) { { account_id: 123 } }
    let(:value) { Faker::Number.decimal(6, 2) }

    let(:balance) do
      {
        balance: value,
        account_id: params[:account_id]
      }
    end

    it "expect to return model Account builded" do
      is_expected.to eq balance
    end
  end
end
