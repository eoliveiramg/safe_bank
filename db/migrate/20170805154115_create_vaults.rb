class CreateVaults < ActiveRecord::Migration[5.1]
  def change
    create_table :vaults do |t|
      t.decimal :value
      t.string :type

      t.timestamps
    end
  end
end
