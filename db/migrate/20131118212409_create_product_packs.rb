class CreateProductPacks < ActiveRecord::Migration
  def change
    create_table :product_packs do |t|
      t.reference :category, null: false
      t.string :name,        null: false
      t.string :image
      t.integer :capacity,   null: false

      t.timestamps
    end
    add_index :product_packs, :category_id
    add_index :product_packs, :capacity
  end
end
