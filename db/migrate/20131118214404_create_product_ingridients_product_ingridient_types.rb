class CreateProductIngridientsProductIngridientTypes < ActiveRecord::Migration
  def change
    create_table :product_ingridients_product_ingridient_types, id: false do |t|
      t.references :product_ingridient,      null: false
      t.references :product_ingridient_type, null: false
    end
    add_index :product_ingridients_product_ingridient_types, :product_ingridient_id
    add_index :product_ingridients_product_ingridient_types, :product_ingridient_type_id
  end
end
