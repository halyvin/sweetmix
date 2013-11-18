class CreateProductPacksIngridients < ActiveRecord::Migration
  def change
    create_table :product_packs_ingridients do |t|
      t.references :product_pack,       null: false
      t.references :product_ingridient, null: false
      t.integer :weight,                null: false
      t.float :price,                   null: false

      t.timestamps
    end
    add_index :product_packs_ingridients, :product_pack_id
    add_index :product_packs_ingridients, :product_ingridient_id
  end
end
