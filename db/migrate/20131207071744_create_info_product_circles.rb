class CreateInfoProductCircles < ActiveRecord::Migration
  def change
    create_table :info_product_circles do |t|
      t.string :title,         null: false
      t.string :url,           null: false
      t.integer :prodcode,     null: false, default: 0
      t.integer :prior,        null: false, default: 10
      t.boolean :hided,        null: false, default: false
    end
    add_index :info_product_circles, :prior
    add_index :info_product_circles, :hided
  end
end
