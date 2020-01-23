class MenuFacade
  attr_reader :menu

  def initialize(menu)
    @menu = menu
  end

  def menu_items_groups
    @menu_items_grouped_by_dish_type ||= @menu.menu_items.group_by(&:menu_type).map do |menu_items_group|
      generate_menu_items_group_obj(menu_items_group[0], menu_items_group[1])
    end
  end

  def menu_items_select_collection
    MenuItem::TYPES_OF_DISHES.map { |menu_item| [menu_item.to_s.humanize, menu_item] }
  end

  def for_today?
    @menu.for_today?
  end

  def available_for_ordering?
    for_today? && @menu.menu_items.present?
  end

  private

  def generate_menu_items_group_obj(dish_type, items)
    OpenStruct.new(menu_items_type: dish_type.humanize, menu_items: items)
  end
end
