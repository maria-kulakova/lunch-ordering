class OrdersController < ApplicationController
  before_action :set_menu, only: %i[new index]

  def index
    @menus = Menu.all
    @orders = @menu.present? ? Order.for_menu(@menu.id) : Order.all
  end

  def new; end

  def create
    data = params.dup

    data[:current_user_id] = current_user.id

    return redirect_to menus_path if OrderCreator.call(data).success?

    render :new
  end

  private

  def set_menu
    @menu = Menu.find(order_params[:menu_id]) if order_params[:menu_id].present?
  end

  def order_params
    params.permit(:menu_id)
  end
end
