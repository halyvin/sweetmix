class CreateProductsCategories < ActiveRecord::Migration
  def change
    create_table :products_categories do |t|
      t.string :name_one
      t.string :name_few
      t.string :name_many
      t.string :name_other
      t.string :slug, null: false
      t.string :icon
    end
    add_index :products_categories, :slug, unique: true
  end
end
