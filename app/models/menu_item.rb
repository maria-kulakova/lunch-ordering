class MenuItem < ApplicationRecord
  has_and_belongs_to_many :orders
  belongs_to :menu

  enum menu_type: {
    first_course: FIRST_СOURSE = 'first_course'.freeze,
    second_course: SECOND_COURSE = 'second_course'.freeze,
    drink: DRINK = 'drink'.freeze
  }

  TYPES_OF_DISHES = [FIRST_СOURSE, SECOND_COURSE, DRINK].freeze

  validates :name, :price, presence: true
  validates :price, numericality: true
end
