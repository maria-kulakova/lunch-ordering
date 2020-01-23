class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.date :menu_date

      t.timestamps
    end
  end
end
