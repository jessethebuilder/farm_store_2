class CreatePriceVariants < ActiveRecord::Migration[5.0]
  def change
    create_table :price_variants do |t|
      t.integer :product_id
      t.string :name
      t.text :description
      t.float :adjustment

      t.timestamps
    end
  end
end
