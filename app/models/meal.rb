class Meal < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :users
  belongs_to :meal_type
end
