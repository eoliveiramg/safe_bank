class Account < ApplicationRecord
  has_many :vaults

  validates_presence_of :name

  scope :total_credit, ->(id:) { Vault.account_total_credit(id) }
  scope :total_debit, ->(id:) { Vault.account_total_debit(id) }

  def self.balance(id)
    total_credit(id: id) - total_debit(id: id)
  end
end
