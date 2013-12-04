class AddAncestryToMainNavItem < ActiveRecord::Migration
  def change
    add_column :main_nav_items, :ancestry, :string
  end
end
