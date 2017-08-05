require 'rails_helper'

RSpec.describe VaultFactory do
  describe ".build" do
    subject { described_class.build(params) }

    let(:params) do
      {
        value: value,
        type_value: type_value,
        account_id: account.id
      }
    end
    let(:value) { Faker::Number.decimal(8, 2) }
    let(:type_value) { "credit" }
    let(:account) { instance_spy Account }
    let(:vault) { instance_spy Vault }

    before do
      allow(Vault).to receive(:new)
        .with(
          value: value,
          type_value: type_value,
          account_id: account.id
        ).and_return(vault)
    end

    it "expect to return model Vault builded" do
      is_expected.to eq vault
    end
  end
end
