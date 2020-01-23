class CreateMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_items do |t|
      t.references :menu, null: false, foreign_key: true
      t.integer :menu_type 
      t.string :name
      t.float :price

      t.timestamps
    end
  end
end
