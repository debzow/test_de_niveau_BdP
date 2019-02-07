class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  #favorit meal
  belongs_to :favorit, :class_name => "Meal", foreign_key: 'meal_id', optional: true
  #meal type restriction
  belongs_to :restriction, :class_name => "MealType", foreign_key: 'meal_type_id', optional: true
end
