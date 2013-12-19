class CreateProductsIngridientsRelations < ActiveRecord::Migration
  def change
    create_table :products_ingridients_relations do |t|
      t.references :product_ingridient, null: false
      t.references :product,            null: false
      t.integer :count,                 null: false, default: 1
    end
    add_index :products_ingridients_relations, :product_ingridient_id
    add_index :products_ingridients_relations, :product_id
  end
end
