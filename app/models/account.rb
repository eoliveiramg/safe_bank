class Account < ApplicationRecord
  has_many :vaults

  validates_presence_of :name
end
