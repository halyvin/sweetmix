class CreateProductIngridientsProducts < ActiveRecord::Migration
  def change
    create_table :product_ingridients_products, id: false do |t|
      t.references :product_ingridient, null: false
      t.references :product,            null: false
    end
    add_index :product_ingridients_products, :product_ingridient_id
    add_index :product_ingridients_products, :product_id
  end
end
