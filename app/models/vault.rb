class Vault < ApplicationRecord
  belongs_to :account

  validates_presence_of :value,
                        :type_value

  enum type_value: { credit: 0, debit: 1 }

  scope :account_total_credit, ->(account_id) do
    where('account_id = ? and type_value = ?', account_id, 0)
      .sum(:value)
  end

  scope :account_total_debit, ->(account_id) do
    where('account_id = ? and type_value = ?', account_id, 1)
      .sum(:value)
  end
end
