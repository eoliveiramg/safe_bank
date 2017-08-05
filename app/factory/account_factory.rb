class AccountFactory
  def self.build(account_params)
    Account.new(
      name: account_params.fetch(:name)
    )
  end
end
