class CreateProductBases < ActiveRecord::Migration
  def change
    create_table :product_bases do |t|
      t.string :name, null: false
      t.string :image
      t.text :descr
      t.text :composition
      t.text :nutr_val

      t.timestamps
    end
  end
end
