class AddAccountToVault < ActiveRecord::Migration[5.1]
  def change
    add_reference :vaults, :account, foreign_key: true
  end
end
