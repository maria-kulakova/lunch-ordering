class ChangeMenuTypeToBeStringInMenuItems < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      ALTER TABLE menu_items MODIFY menu_type enum('first_course', 'second_course', 'drink');
    SQL
  end
      
  def down
    change_column :menu_items, :menu_type, :string
  end
end
