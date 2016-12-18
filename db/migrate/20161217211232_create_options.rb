class CreateOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
      t.integer :product_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
