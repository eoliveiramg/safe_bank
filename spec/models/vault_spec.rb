require 'rails_helper'

RSpec.describe Vault, type: :model do
  it { is_expected.to belong_to(:account) }

  it { is_expected.to validate_presence_of(:value) }
  it { is_expected.to validate_presence_of(:type_value) }

  it { is_expected.to define_enum_for(:type_value).with(%w(credit debit)) }

  describe '#account_total_credit' do
    subject { described_class.account_total_credit(Account.first.id) }

    before { create :account }

    it 'return the correct value with credit total value' do
      vault_1 = create :vault, type_value: 0, account: Account.first
      vault_2 = create :vault, type_value: 0, account: Account.first
      vault_3 = create :vault, type_value: 1, account: Account.first

      expect(subject).to eq(vault_1.value + vault_2.value)
    end
  end

  describe '#account_total_debit' do
    subject { described_class.account_total_debit(Account.first.id) }

    before { create :account }

    it 'return the correct value with credit total value' do
      vault_1 = create :vault, type_value: 1, account: Account.first
      vault_2 = create :vault, type_value: 1, account: Account.first
      vault_3 = create :vault, type_value: 0, account: Account.first

      expect(subject).to eq(vault_1.value + vault_2.value)
    end
  end
end
