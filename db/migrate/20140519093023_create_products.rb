class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :localization
      t.text :description
      t.integer :quantity
      t.references :category, index: true

      t.timestamps
    end
  end
end
