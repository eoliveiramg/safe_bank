class BalanceFactory
  def self.build(value, balance_params)
    {
      balance: value,
      account_id: balance_params.fetch(:account_id)
    }
  end
end
