Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit_meal_restriction'
  put 'users/update_meal_restriction'
  root 'tests#test_one'
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
