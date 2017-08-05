class AddPrecisionToValueColumn < ActiveRecord::Migration[5.1]
  def self.up
    change_column :vaults, :value, :decimal, precision: 8, scale: 2
  end

  def self.down
    change_column :vaults, :value, :decimal
  end
end
