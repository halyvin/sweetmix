class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.boolean :pcba
      t.boolean :plain
      t.string :name
      t.string :article
      t.string :image
      t.float :price,    null: false
      t.integer :weight
      t.references :category
      t.references :pack
      t.references :basis

      t.timestamps
    end
    add_index :products, :pcba
    add_index :products, :plain
    add_index :products, :category_id
    add_index :products, :pack_id
    add_index :products, :basis_id
  end
end
