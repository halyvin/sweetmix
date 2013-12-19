class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.boolean :pcba
      t.string :name,    null: false
      t.float :price,    null: false
      t.string :own_image
      t.text :own_descr
      t.boolean :plain
      t.integer :weight
      t.references :category
      t.references :pack
      t.references :basis
      t.boolean :hided,  null: false, default: false

      t.timestamps
    end
    add_index :products, :pcba
    add_index :products, :plain
    add_index :products, :category_id
    add_index :products, :pack_id
    add_index :products, :basis_id
    add_index :products, :hided
  end
end
