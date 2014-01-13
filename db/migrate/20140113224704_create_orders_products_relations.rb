class CreateOrdersProductsRelations < ActiveRecord::Migration
  def change
    create_table :orders_products_relations do |t|
      t.references :order,   null: false
      t.references :product, null: false
      t.integer    :count,   null: false, default: 1
    end
    add_index :orders_products_relations, :order_id
    add_index :orders_products_relations, :product_id
  end
end
