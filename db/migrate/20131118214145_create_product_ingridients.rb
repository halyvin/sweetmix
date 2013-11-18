class CreateProductIngridients < ActiveRecord::Migration
  def change
    create_table :product_ingridients do |t|
      t.string :name,  null: false
      t.string :image

      t.timestamps
    end
  end
end
