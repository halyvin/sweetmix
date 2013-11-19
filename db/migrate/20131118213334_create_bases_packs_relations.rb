class CreateBasesPacksRelations < ActiveRecord::Migration
  def change
    create_table :bases_packs_relations do |t|
      t.references :product_pack,  null: false
      t.references :product_basis, null: false
      t.integer :weight,           null: false
      t.float :price,              null: false

      t.timestamps
    end
    add_index :bases_packs_relations, :product_pack_id
    add_index :bases_packs_relations, :product_basis_id
  end
end
