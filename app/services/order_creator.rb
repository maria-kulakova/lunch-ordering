class OrderCreator < ApplicationService
  def call
    @menu_item_ids = get_menu_item_ids
    return responce(false, I18n.t('order.messages.no_items')) if @menu_item_ids.empty?

    order = generate_new_order_with_relations
    order.save ? responce(true, I18n.t('order.messages.created'), order) : responce(false, order.errors)
  end

  private

  def get_menu_item_ids
    MenuItem::TYPES_OF_DISHES.map { |dish_type| data["#{dish_type}_id"] }.compact
  end

  def generate_new_order_with_relations
    menu_items = MenuItem.find(@menu_item_ids)
    menu = Menu.find(data[:menu_id])
    total_price = menu_items.sum(&:price)
    order = Order.new(user_id: data[:current_user_id], total_price: total_price, menu_id: menu.id)
    order.menu_items << menu_items
    order
  end
end
