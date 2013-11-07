class CreateMainNavItems < ActiveRecord::Migration
  def migrate(direction)
    super
    MainNavItem.create!(title: "Home", url_type: 1, url_page: ContentPage.first, prior: 1) if direction == :up
  end
  def change
    create_table :main_nav_items do |t|
      t.string :title
      t.integer :url_type,   null: false, default: 0
      t.references :url_page
      t.string :url_text
      t.integer :prior,      null: false, default: 10
      t.boolean :hided,      null: false, default: false

      t.timestamps
    end
    add_index :main_nav_items, :url_page_id
    add_index :main_nav_items, :prior
    add_index :main_nav_items, :hided
  end
end