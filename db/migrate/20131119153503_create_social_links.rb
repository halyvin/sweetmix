class CreateSocialLinks < ActiveRecord::Migration
  def change
    create_table :social_links do |t|
      t.integer :social_type,  null: false
      t.string  :url,          null: false
      t.integer :prior,        null: false, default: 10
      t.boolean :hided,        null: false, default: false

      t.timestamps
    end
    add_index :social_links, :prior
    add_index :social_links, :hided
  end
end
