class AddMenuToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :menu, foreign_key: true
  end
end
