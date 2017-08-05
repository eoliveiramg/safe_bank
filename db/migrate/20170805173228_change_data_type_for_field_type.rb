class ChangeDataTypeForFieldType < ActiveRecord::Migration[5.1]
  def self.up
    change_column :vaults, :type, 'integer USING CAST(type AS integer)'
  end

  def self.down
    change_column :vaults, :type, 'string USING CAST(type AS string)'
  end
end
