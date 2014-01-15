class AddIndexesToOrders < ActiveRecord::Migration
  def change
    add_index :orders, :secret, :unique => true
    add_index :orders, :pay_status
    add_index :orders, :price
    add_index :orders, :clt_email
    add_index :orders, :dlv_date
  end
end
