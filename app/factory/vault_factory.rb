class VaultFactory
  def self.build(vault_params)
    Vault.new(
      value: vault_params.fetch(:value),
      type_value: vault_params.fetch(:type_value),
      account_id: vault_params.fetch(:account_id)
    )
  end
end
