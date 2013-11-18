class CreateProductPacksBases < ActiveRecord::Migration
  def change
    create_table :product_packs_bases do |t|
      t.references :product_pack,  null: false
      t.references :product_basis, null: false
      t.integer :weight,           null: false
      t.float :price,              null: false

      t.timestamps
    end
    add_index :product_packs_bases, :product_pack_id
    add_index :product_packs_bases, :product_basis_id
  end
end
