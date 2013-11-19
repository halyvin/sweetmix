class CreateIngridientsPacksRelations < ActiveRecord::Migration
  def change
    create_table :ingridients_packs_relations do |t|
      t.references :product_pack,       null: false
      t.references :product_ingridient, null: false
      t.integer :weight,                null: false
      t.float :price,                   null: false

      t.timestamps
    end
    add_index :ingridients_packs_relations, :product_pack_id
    add_index :ingridients_packs_relations, :product_ingridient_id
  end
end
