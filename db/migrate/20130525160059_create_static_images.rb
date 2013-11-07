class CreateStaticImages < ActiveRecord::Migration
  def change
    create_table :static_images do |t|
      t.string :image, null: false

      t.timestamps
    end
  end
end
