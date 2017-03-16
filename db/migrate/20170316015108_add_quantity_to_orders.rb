class AddQuantityToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :quantity, :int
  end
end
