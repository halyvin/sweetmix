class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.string :name_one
      t.string :name_few
      t.string :name_many
      t.string :name_other
      t.string :slug, null: false
      t.string :icon
      t.boolean :construct_off
    end
    add_index :product_categories, :slug, unique: true
  end
end
