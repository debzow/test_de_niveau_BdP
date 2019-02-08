Rails.application.routes.draw do
  root 'meals#index'
  get 'meals/show/:id', to: 'meals#show', as: 'meals_show' 

  get 'users/show'
  get 'users/edit_meal_restriction'
  put 'users/update_meal_restriction'
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
