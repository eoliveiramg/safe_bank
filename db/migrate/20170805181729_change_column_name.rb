class ChangeColumnName < ActiveRecord::Migration[5.1]
  def self.up
    rename_column :vaults, :type, :type_value
  end

  def self.down
    rename_column :vaults, :type_value, :type
  end
end
