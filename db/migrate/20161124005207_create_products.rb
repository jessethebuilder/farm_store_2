class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.float :weight
      t.float :height
      t.float :width
      t.float :length
      t.string :sku
      t.integer :units_in_stock
      t.string :slug
      t.boolean :published, default: false
      t.boolean :archived, default: false
      t.integer :department_id
      
      t.timestamps
    end
  end
end
