class Menu < ApplicationRecord
  has_many :menu_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  accepts_nested_attributes_for :menu_items, allow_destroy: true

  validates :menu_date, uniqueness: true

  scope :for_today, -> { find_by(menu_date: Time.zone.today) }

  def for_today?
    menu_date == Time.zone.today
  end
end
