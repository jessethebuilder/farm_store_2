class CreateOrderItemAdds < ActiveRecord::Migration[5.0]
  def change
    create_table :order_item_adds do |t|
      t.integer :order_item_id
      t.integer :price_variant_id
      t.integer :option_id

      t.timestamps
    end
  end
end
