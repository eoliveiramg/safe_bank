require 'rails_helper'

RSpec.describe TransactionFactory do
  describe ".build" do
    subject { described_class.build(debit_transaction, credit_transaction) }

    let(:debit_transaction) do
      create :vault, type_value: 1, account: Account.first
    end

    let(:credit_transaction) do
      create :vault, type_value: 1, account: Account.last
    end

    let(:transaction) do
      {
        source_account: {
          account_id: debit_transaction.account_id,
          transaction_id: debit_transaction.id,
          transaction_value: debit_transaction.value,
          transaction_type: debit_transaction.type_value
        },
        destination_account: {
          account_id: credit_transaction.account_id,
          transaction_id: credit_transaction.id,
          transaction_value: credit_transaction.value,
          transaction_type: credit_transaction.type_value
        }
      }
    end

    before do
      create_list :account, 2
    end

    it "expect to return model Account builded" do
      is_expected.to eq transaction
    end
  end
end
