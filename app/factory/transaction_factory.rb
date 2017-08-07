class TransactionFactory
  def self.build(debit_transaction, credit_transaction)
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
end
