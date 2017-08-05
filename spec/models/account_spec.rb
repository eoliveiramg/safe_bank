require 'rails_helper'

RSpec.describe Account, type: :model do
  it { is_expected.to have_many(:vaults) }

  it { is_expected.to validate_presence_of(:name) }
end
