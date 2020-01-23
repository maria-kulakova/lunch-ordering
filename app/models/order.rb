class Order < ApplicationRecord
  has_and_belongs_to_many :menu_items
  belongs_to :user
  belongs_to :menu

  scope :for_menu, ->(menu_id) { where(menu_id: menu_id) }
end
