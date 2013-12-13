class CreateProductIngridients < ActiveRecord::Migration
  def change
    create_table :product_ingridients do |t|
      t.references :type, null: false
      t.string :name,     null: false
      t.string :image
      t.text :descr

      t.timestamps
    end
    add_index :product_ingridients, :type_id
  end
end
