class MealsController < ApplicationController
  def index
    if user_signed_in?
      if current_user.restriction
        @meals = Meal.where.not(meal_type_id: current_user.restriction.id)
      else
        @meals = Meal.all
      end
    else
      @meals = Meal.all
    end

  end

  def show
    if user_signed_in?
      @meal = Meal.find(params[:id])
    else
      redirect_to(root_path)
      flash[:alert]="You must be logged in"
    end
  end
end
