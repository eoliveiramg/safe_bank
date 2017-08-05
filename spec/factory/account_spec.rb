require 'rails_helper'

RSpec.describe AccountFactory do
  describe ".build" do
    subject { described_class.build(params) }

    let(:params) { { name: name } }
    let(:name) { "name-foo" }
    let(:account) { instance_spy Account }

    before { allow(Account).to receive(:new).with(name: name).and_return(account) }

    it "expect to return model Account builded" do
      is_expected.to eq account
    end
  end
end
