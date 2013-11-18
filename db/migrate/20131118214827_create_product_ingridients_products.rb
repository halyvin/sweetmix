class CreateProductsProductIngridients < ActiveRecord::Migration
  def change
    create_table :products_product_ingridients, id: false do |t|
      t.references :product_ingridient, null: false
      t.references :product,            null: false
    end
    add_index :products_product_ingridients, :product_ingridient_id
    add_index :products_product_ingridients, :product_id
  end
end
