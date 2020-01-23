class CreateMenuItemsOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_items_orders do |t|
      t.belongs_to :menu_item
      t.belongs_to :order
    end
  end
end
