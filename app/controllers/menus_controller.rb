class MenusController < ApplicationController
  before_action :set_menu, only: %i[show edit update]

  def index
    @menus = Menu.all
  end

  def show
    @menu_facade = MenuFacade.new(@menu)
  end

  def edit
    @menu_facade = MenuFacade.new(@menu)
    return redirect_to menus_path unless @menu_facade.for_today?
  end

  def update
    return redirect_to(menus_path) if @menu.update(menu_params)

    render :new
  end

  private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
    params.require(:menu)
          .permit(:menu_type, :name, :price,
                  menu_items_attributes: %i[id menu_id menu_type name price _destroy])
  end
end
