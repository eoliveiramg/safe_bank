require 'rails_helper'

RSpec.describe Vault, type: :model do
  it { is_expected.to belong_to(:account) }

  it { is_expected.to validate_presence_of(:value) }
  it { is_expected.to validate_presence_of(:type_value) }

  it { is_expected.to define_enum_for(:type_value).with(%w(credit debit)) }
end
