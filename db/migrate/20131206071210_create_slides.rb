class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :title,         null: false
      t.string :subtitle
      t.string :image
      t.text :descr
      t.string :btn_text
      t.string :btn_link
      t.integer :backg
      t.boolean :image_at_right
      t.boolean :custom
      t.integer :prior,        null: false, default: 10
      t.boolean :hided,        null: false, default: false

      t.timestamps
    end
    add_index :slides, :prior
    add_index :slides, :hided
  end
end
