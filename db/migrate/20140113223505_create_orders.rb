class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :secret, null: false

      t.integer :pay_status, null: false, default: 0

      t.text :products_hash, null: false

      t.float :price,          null: false
      t.float :products_price, null: false
      t.float :delivery_price
      t.float :discount_sum

      t.string :clt_email,      null: false
      t.string :clt_first_name, null: false
      t.string :clt_last_name
      t.string :clt_phone

      t.date   :dlv_date, null: false
      t.string :dlv_period
      t.string :dlv_city,   null: false
      t.text   :dlv_address,  null: false

      t.text :clt_comment

      t.timestamps
    end
  end
end
