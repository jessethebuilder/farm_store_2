class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :has_farm_store_accounts_type
      t.integer :has_farm_store_accounts_id

      t.timestamps
    end
  end
end
