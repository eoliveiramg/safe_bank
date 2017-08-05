class Vault < ApplicationRecord
  belongs_to :account

  validates_presence_of :value,
                        :type_value

  enum type_value: { credit: 0, debit: 1 }
end
