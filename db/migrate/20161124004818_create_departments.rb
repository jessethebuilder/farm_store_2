class CreateDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :departments do |t|
      t.string :name
      t.text :description
      t.string :slug
      t.boolean :published, default: false
      t.boolean :archived, default: false

      t.timestamps
    end
  end
end
