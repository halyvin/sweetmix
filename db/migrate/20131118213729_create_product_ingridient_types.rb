class CreateProductIngridientTypes < ActiveRecord::Migration
  def change
    create_table :product_ingridient_types do |t|
      t.string :name, null: false
    end
  end
end
