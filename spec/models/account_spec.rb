require 'rails_helper'

RSpec.describe Account, type: :model do
  it { is_expected.to have_many(:vaults) }

  it { is_expected.to validate_presence_of(:name) }

  describe '#total_credit' do
    subject { described_class.total_credit(id: id) }

    let(:total_credit) { 1000.02 }
    let(:id) { 1234 }

    before do
      allow(Vault).to receive(:account_total_credit).with(id).and_return(total_credit)
    end

    it 'return the correct value with credit total value' do
      expect(subject).to eq(total_credit)
    end
  end

  describe '#total_debit' do
    subject { described_class.total_debit(id: id) }

    let(:total_debit) { -1000.02 }
    let(:id) { 1234 }

    before do
      allow(Vault).to receive(:account_total_debit).with(id).and_return(total_debit)
    end

    it 'return the correct value with credit total value' do
      expect(subject).to eq(total_debit)
    end
  end

  describe '#balance' do
    subject { described_class.balance(id) }

    let(:total_debit) { -1000.02 }
    let(:total_credit) { 1000.02 }
    let(:id) { 1234 }

    before do
      allow(Vault).to receive(:account_total_credit).with(id).and_return(total_credit)
      allow(Vault).to receive(:account_total_debit).with(id).and_return(total_debit)
    end

    it 'return the correct value with credit total value' do
      expect(subject).to eq(total_credit - total_debit)
    end
  end
end
