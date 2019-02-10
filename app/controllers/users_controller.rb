class UsersController < ApplicationController
  def show
    if user_signed_in?
      @user = current_user
    else
      redirect_to(root_path)
      flash[:alert]="You must be logged in"
    end
  end

  def edit_meal_restriction
    if user_signed_in?
        @meal_types = []
        MealType.all.each do |meal_type|
          @meal_types << [meal_type.name, meal_type.id]
        end
      if current_user.restriction
        @restriction = current_user.restriction.id
      else
        @restriction = MealType.first.id
      end
    else
      redirect_to(root_path)
      flash[:alert]="You must be logged in"
    end
  end

  def update_meal_restriction
    if MealType.find(params[:dropdown][:household_number])
      current_user.update(meal_type_id: params[:dropdown][:household_number])
      redirect_to(users_show_path)
    else
      #err
    end
  end

  def update_favorit_meal
    if user_signed_in?
      meal = Meal.find(params[:id])
      if current_user.favorit == meal
        flash[:warning]="Already favorit meal"
      else
        current_user.update(meal_id: meal.id)
        flash[:success]="Successfully add as favorit meal"
      end
      redirect_to(meals_show_path(meal.id))
    else
      redirect_to(root_path)
      flash[:alert]="You must be logged in"
    end
  end
end
